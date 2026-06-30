#!/usr/bin/env bash
#
# Parallel build + version-tagged push to GHCR for a list of images.
#
# Why this exists: the on-CI build-and-push.yml runs one image per
# matrix job and is throttled by GHA runner availability. On this
# laptop we can fan out 4-8 builds at once using nix's evaluator
# pool and saturate the upload pipe.
#
# This driver intentionally does NOT scan or oras-attach. Once the
# pushes are done, dispatch security-scan.yml (gh workflow run) to
# scan the pushed images via its 20-shard matrix — that artifact is
# what deploy-website.yml reads to refresh CVE counts on the site.
#
# Usage:
#   scripts/local-build-push.sh <image-list> [--parallel N] [--dispatch-scan]
#
# State files:
#   audit-results/local-push/<image>.state in (ok, fail-build, fail-eval, fail-push)
#   Re-runs skip images already marked ok/fail-*.
#
# Auth: reads ~/.docker/config.json (existing `docker login ghcr.io`).

set -uo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <image-list> [--parallel N] [--dispatch-scan]" >&2
  exit 2
fi

LIST="$1"; shift
PARALLEL=6
DISPATCH_SCAN=false
while [ $# -gt 0 ]; do
  case "$1" in
    --parallel) PARALLEL="$2"; shift 2 ;;
    --dispatch-scan) DISPATCH_SCAN=true; shift ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

STATE_DIR="audit-results/local-push"
mkdir -p "$STATE_DIR"

REGISTRY="ghcr.io/nix-containers/images"

# Commit SHA used as an immutable per-build tag (mirrors what
# build-and-push.yml does at .github/workflows/build-and-push.yml:163).
# Captured once so all images in the run share the same value.
COMMIT_SHA=$(git rev-parse HEAD)

# nix2container's copyTo invokes skopeo, which reads
# /etc/containers/registries.conf. On some hosts (including the
# laptop this script was written for) that file is in the legacy v1
# format and skopeo refuses to load it ("registries.conf must be in
# v2 format but is in v1"). Pointing skopeo at /dev/null keeps it
# from looking — auth comes from ~/.docker/config.json regardless.
export CONTAINERS_REGISTRIES_CONF=/dev/null

# Periodic-GC: each build adds to /nix/store; without GC the disk
# fills mid-run. Worker tracks images processed since last GC via a
# shared counter file under STATE_DIR.
GC_AFTER=100
COUNTER_FILE="$STATE_DIR/.gc-counter"
echo 0 > "$COUNTER_FILE"
LOCK_FILE="$STATE_DIR/.gc-lock"

# Worker: process one image. Run under xargs -P. Writes its own state
# file; appends to the counter; on multiple-of-100, triggers gc (single
# worker wins the flock).
process_one() {
  local image="$1"
  local state_file="$STATE_DIR/${image}.state"

  if [ -f "$state_file" ]; then
    return
  fi
  if [ ! -d "images/$image" ]; then
    echo "missing" > "$state_file"
    return
  fi

  # Build
  if ! nix build --no-link ".#$image" 2>/dev/null; then
    echo "fail-build" > "$state_file"
    echo "[$image] fail-build" >&2
    return
  fi

  # Resolve version (same attr build-and-push.yml uses)
  local tag
  tag=$(nix eval --raw ".#${image}.imageTag" 2>/dev/null || echo "")
  if [ -z "$tag" ]; then
    tag="latest"
  fi

  # Tags to push: latest, commit-sha (immutable per build), and the
  # image's declared version when distinct. Matches what
  # build-and-push.yml writes (lines 162-176): every push gets
  # :latest + :<sha> + :<version-if-known>. The commit SHA tag is
  # what guarantees every image — even those without a static version
  # label — gets at least one immutable tag.
  local push_tags=("latest" "$COMMIT_SHA")
  if [ -n "$tag" ] && [ "$tag" != "latest" ] && [ "$tag" != "$COMMIT_SHA" ]; then
    push_tags+=("$tag")
  fi

  local t
  for t in "${push_tags[@]}"; do
    if ! nix run ".#${image}.copyTo" -- "docker://${REGISTRY}/${image}:${t}" >/dev/null 2>&1; then
      echo "fail-push" > "$state_file"
      echo "[$image] fail-push (:$t)" >&2
      return
    fi
  done

  echo "ok" > "$state_file"
  echo "[$image] ok (tags: ${push_tags[*]})" >&2

  # Periodic GC. Use flock so only one worker runs it at a time;
  # the others skip and continue.
  (
    flock -n 9 || exit 0
    local n
    n=$(cat "$COUNTER_FILE" 2>/dev/null || echo 0)
    n=$((n + 1))
    echo "$n" > "$COUNTER_FILE"
    if [ "$n" -ge "$GC_AFTER" ]; then
      echo "==> periodic gc (every $GC_AFTER images)" >&2
      nix-collect-garbage 2>&1 | tail -2 >&2 || true
      docker image prune -f >/dev/null 2>&1 || true
      echo 0 > "$COUNTER_FILE"
    fi
  ) 9>"$LOCK_FILE"
}
export -f process_one
export STATE_DIR REGISTRY GC_AFTER COUNTER_FILE LOCK_FILE COMMIT_SHA CONTAINERS_REGISTRIES_CONF

START=$(date +%s)
TOTAL=$(wc -l < "$LIST")
echo "==> driver: parallel=$PARALLEL list=$LIST total=$TOTAL"

tr '\n' '\0' < "$LIST" \
  | xargs -0 -n 1 -P "$PARALLEL" -I {} bash -c 'process_one "$@"' _ {}

END=$(date +%s)
ELAPSED=$((END - START))

OK=$(grep -l "^ok$" "$STATE_DIR"/*.state 2>/dev/null | wc -l)
FB=$(grep -l "^fail-build$" "$STATE_DIR"/*.state 2>/dev/null | wc -l)
FP=$(grep -l "^fail-push$" "$STATE_DIR"/*.state 2>/dev/null | wc -l)
echo ""
echo "==> summary (elapsed ${ELAPSED}s = $((ELAPSED/3600))h $(((ELAPSED%3600)/60))m)"
echo "    ok:         $OK"
echo "    fail-build: $FB"
echo "    fail-push:  $FP"
echo ""

if [ "$DISPATCH_SCAN" = "true" ]; then
  echo "==> dispatching security-scan.yml to refresh CVE artifact"
  gh workflow run security-scan.yml --repo nix-containers/images --ref main 2>&1 | tail -2
  echo "    Watch with: gh run watch \$(gh run list --workflow=security-scan.yml --limit 1 --json databaseId --jq '.[0].databaseId')"
fi
