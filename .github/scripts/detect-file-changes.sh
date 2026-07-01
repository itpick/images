#!/usr/bin/env bash
# Classify changed file paths into per-image and shared-rebuild-all buckets.
# Reads paths from stdin (one per line). Discovered-images matrix
# (shape: {"include":[{"name","path"},...]}) is supplied either as
# FULL_MATRIX env var (small fixtures, tests) or via FULL_MATRIX_PATH
# pointing to a file (used by CI: matrices for thousands of images blow
# past ARG_MAX if passed in env).
#
# Output shape: {"changes-detected": "true|false",
#                "changed-images": {"include": [...]},
#                "rebuild-all": "true|false"}
#
# When rebuild-all is true, changed-images is INTENTIONALLY empty. The
# consumer (select-matrix in build-containers.yml) substitutes the full
# discovered matrix on its own. This keeps the 200KB+ matrix from
# transiting step boundaries and re-hitting ARG_MAX.
#
# Dependency awareness: a change to a specific overlay package
# `pkgs/<dir>/...` does NOT rebuild the whole catalog (which, at 3000+
# images, exceeds the 256-job matrix cap and gets skipped entirely —
# i.e. the dependent images would never rebuild). Instead we resolve the
# images that actually consume that package and rebuild just those:
#   pkgs/<dir>  --(pkgs/default.nix)-->  attr name(s)  --(grep images)-->  images
# Only the overlay index itself (pkgs/default.nix) still triggers
# rebuild-all, since it can restructure the whole attr set.
#
# REPO_ROOT (default ".") locates pkgs/default.nix and images/ for the
# dependency resolution; tests point it at a fixture tree.
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-.}"

if [ -z "${FULL_MATRIX_PATH:-}" ]; then
  : "${FULL_MATRIX:?FULL_MATRIX or FULL_MATRIX_PATH required}"
  FULL_MATRIX_PATH="$(mktemp)"
  printf '%s' "$FULL_MATRIX" > "$FULL_MATRIX_PATH"
  trap 'rm -f "$FULL_MATRIX_PATH"' EXIT
fi

CHANGED_PATHS=$(jq -Rs 'split("\n") | map(select(length > 0))')

# Truly global paths: any change here rebuilds everything. pkgs/default.nix
# is included because it defines the overlay attr set itself. NOTE: a change
# under pkgs/<dir>/ (a specific package) is handled below as a dependency,
# not here.
REBUILD_ALL=$(printf '%s' "$CHANGED_PATHS" | jq -r '
  any(.[];
    test("^lib/")
    or test("^bundler/")
    or . == "flake.nix"
    or . == "flake.lock"
    or . == "pkgs/default.nix"
    or test("^[^/]+\\.nix$")
  ) | tostring
')

# Resolve the images that consume a changed overlay package. Echoes image
# names (one per line). $1 = package directory name under pkgs/.
images_for_pkg() {
  local dir="$1"
  local overlay="$REPO_ROOT/pkgs/default.nix"
  local -a attrs=()
  # Map dir -> attribute name(s): lines like `foo = pkgs.callPackage ./dir {`.
  # Most dirs match their attr, but some differ (e.g. ./certgen -> cilium-certgen).
  if [ -f "$overlay" ]; then
    mapfile -t attrs < <(grep -oE "[A-Za-z0-9_-]+[[:space:]]*=[[:space:]]*pkgs\.callPackage[[:space:]]+\./${dir}([[:space:]]|/|\{)" "$overlay" 2>/dev/null \
      | sed -E 's/[[:space:]]*=.*//' | sort -u)
  fi
  # Fall back to the dir name itself if the overlay didn't resolve an attr
  # (keeps behaviour sane for packages named identically to their dir).
  [ "${#attrs[@]}" -eq 0 ] && attrs=("$dir")
  local a
  for a in "${attrs[@]}"; do
    # Images reference the package as `pkgs.<attr>` (drv/version/etc.).
    # Word-boundary the attr so pkgs.argo-workflows != pkgs.argo-workflows-fips.
    # `|| true`: no consumers is a normal outcome, not an error under set -e.
    { grep -rlE "pkgs\.${a}([^A-Za-z0-9_-]|$)" "$REPO_ROOT"/images/*/default.nix 2>/dev/null || true; } \
      | sed -E 's#.*/images/([^/]+)/default\.nix#\1#'
  done
}

if [ "$REBUILD_ALL" = "true" ]; then
  CHANGED_INCLUDE='[]'
  CHANGES_DETECTED="true"
else
  # Directly-changed images.
  PER_IMAGE_NAMES=$(printf '%s' "$CHANGED_PATHS" | jq -r '
    [.[] | capture("^images/(?<n>[^/]+)/.+")? | .n] | .[]
  ' 2>/dev/null || true)

  # Changed overlay packages -> their dependent images.
  CHANGED_PKG_DIRS=$(printf '%s' "$CHANGED_PATHS" | jq -r '
    [.[] | capture("^pkgs/(?<d>[^/]+)/.+")? | .d] | unique | .[]
  ' 2>/dev/null || true)
  DEP_IMAGE_NAMES=""
  if [ -n "$CHANGED_PKG_DIRS" ]; then
    while IFS= read -r dir; do
      [ -z "$dir" ] && continue
      DEP_IMAGE_NAMES+=$'\n'"$(images_for_pkg "$dir")"
    done <<< "$CHANGED_PKG_DIRS"
  fi

  ALL_NAMES=$(printf '%s\n%s\n' "$PER_IMAGE_NAMES" "$DEP_IMAGE_NAMES" \
    | sed '/^$/d' | sort -u | jq -Rn '[inputs]')

  # --slurpfile loads from disk, avoiding ARG_MAX when the full matrix is huge.
  CHANGED_INCLUDE=$(jq -cn \
    --argjson names "$ALL_NAMES" \
    --slurpfile full "$FULL_MATRIX_PATH" '
    [$full[0].include[] | select(.name as $n | $names | index($n))]
  ')
  CHANGES_DETECTED=$(printf '%s' "$CHANGED_INCLUDE" | jq -r 'if length > 0 then "true" else "false" end')
fi

jq -cn \
  --arg detected "$CHANGES_DETECTED" \
  --argjson inc "$CHANGED_INCLUDE" \
  --arg rebuild "$REBUILD_ALL" \
  '{"changes-detected": $detected, "changed-images": {"include": $inc}, "rebuild-all": $rebuild}'
