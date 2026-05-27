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
set -euo pipefail

if [ -z "${FULL_MATRIX_PATH:-}" ]; then
  : "${FULL_MATRIX:?FULL_MATRIX or FULL_MATRIX_PATH required}"
  FULL_MATRIX_PATH="$(mktemp)"
  printf '%s' "$FULL_MATRIX" > "$FULL_MATRIX_PATH"
  trap 'rm -f "$FULL_MATRIX_PATH"' EXIT
fi

CHANGED_PATHS=$(jq -Rs 'split("\n") | map(select(length > 0))')

# Detect shared paths: any change to these triggers rebuild-all.
# Patterns checked: lib/**, pkgs/**, bundler/**, flake.nix, flake.lock,
# and any *.nix file at the repo root.
REBUILD_ALL=$(printf '%s' "$CHANGED_PATHS" | jq -r '
  any(.[];
    test("^lib/")
    or test("^pkgs/")
    or test("^bundler/")
    or . == "flake.nix"
    or . == "flake.lock"
    or test("^[^/]+\\.nix$")
  ) | tostring
')

if [ "$REBUILD_ALL" = "true" ]; then
  CHANGED_INCLUDE='[]'
  CHANGES_DETECTED="true"
else
  PER_IMAGE_NAMES=$(printf '%s' "$CHANGED_PATHS" | jq -c '
    [.[] | capture("^images/(?<n>[^/]+)/.+")? | .n] | unique
  ')
  # --slurpfile loads from disk, avoiding ARG_MAX when the full matrix is huge.
  CHANGED_INCLUDE=$(jq -cn \
    --argjson names "$PER_IMAGE_NAMES" \
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
