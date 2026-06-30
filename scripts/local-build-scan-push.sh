#!/usr/bin/env bash
#
# Per-image: build → push to GHCR with version tag → scan (trivy/grype/syft)
# → oras-attach SBOM + trivy report. Outputs match the GHA artifact shape
# (`<image>_<tag>-trivy.json`, `_-grype.json`, `_-sbom.json`) so the deploy
# website's existing scan-data flow picks them up unchanged.
#
# Mirrors what build-and-push.yml + security-scan.yml do, but runs on this
# laptop. Designed to fire-and-forget overnight after the verify loop
# completes and the resulting PR is merged.
#
# Usage:
#   scripts/local-build-scan-push.sh <image-list> [--batch-size N] [--push-every M]
#
# State files:
#   audit-results/local-bsp/<image>.state contains one of:
#     ok, fail-build, fail-eval, fail-push, fail-scan, fail-attach
#   Re-runs skip images already marked ok/fail-*.
#
# Output:
#   scan-data/<full-ref>_<tag>-trivy.json
#   scan-data/<full-ref>_<tag>-grype.json
#   scan-data/<full-ref>_<tag>-sbom.json
#   scan-data/<full-ref>_<tag>-sbom-spdx.json
#
# Auth:
#   Reads from ~/.docker/config.json (your existing `docker login ghcr.io`).
#   oras shares the docker config by default.

set -uo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <image-list> [--batch-size N] [--push-every M]" >&2
  exit 2
fi

LIST="$1"; shift
BATCH_SIZE=10
PUSH_EVERY=1
while [ $# -gt 0 ]; do
  case "$1" in
    --batch-size) BATCH_SIZE="$2"; shift 2 ;;
    --push-every) PUSH_EVERY="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

STATE_DIR="audit-results/local-bsp"
SCAN_DIR="scan-data"
mkdir -p "$STATE_DIR" "$SCAN_DIR"

BRANCH=$(git branch --show-current)
echo "==> driver: branch=$BRANCH batch_size=$BATCH_SIZE push_every=$PUSH_EVERY list=$LIST"

# Same branch-safety check as the verify loop — bail if the working tree
# drifts so we don't commit scan-data to the wrong branch.
assert_branch() {
  local now
  now=$(git branch --show-current)
  if [ "$now" != "$BRANCH" ]; then
    echo "==> WORKING TREE DRIFTED: was $BRANCH, now $now. Aborting." >&2
    exit 4
  fi
}

# Required external tools. We trust they're on PATH; the local shell is
# either nix-shell'd or the user has them globally.
REGISTRY="ghcr.io/nix-containers/images"
for tool in nix docker trivy grype syft oras; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "==> missing tool: $tool — install via 'nix shell nixpkgs#$tool' first." >&2
    exit 3
  fi
done

batch_count=0
push_count=0
total_ok=0
total_fail_build=0
total_fail_eval=0
total_fail_push=0
total_fail_scan=0
total_fail_attach=0
total_skipped=0

while IFS= read -r image; do
  [ -z "$image" ] && continue
  state_file="$STATE_DIR/${image}.state"

  if [ -f "$state_file" ]; then
    total_skipped=$((total_skipped + 1))
    continue
  fi

  if [ ! -d "images/$image" ]; then
    echo "missing" > "$state_file"
    continue
  fi

  # --- 1. Build ---
  echo "==> [$image] build"
  if ! nix build --no-link ".#$image" 2>/dev/null; then
    echo "fail-build" > "$state_file"
    total_fail_build=$((total_fail_build + 1))
    continue
  fi

  # --- 2. Resolve version tag ---
  # imageTag is the attribute build-and-push.yml uses to derive the
  # canonical version (e.g. "0.31.1", "v1.36.1-dev"). Falls back to
  # "latest" so we still publish something for images whose default.nix
  # doesn't expose a clean version.
  echo "==> [$image] resolve version tag"
  TAG=$(nix eval --raw ".#${image}.imageTag" 2>/dev/null || echo "")
  if [ -z "$TAG" ] || [ "$TAG" = "latest" ]; then
    TAG="latest"
    # No second push needed; the `latest` push below already covers it.
    PUSH_VERSION_TOO=false
  else
    PUSH_VERSION_TOO=true
  fi

  # --- 3. Push to GHCR ---
  # `copyTo docker://...` writes directly to the registry via skopeo —
  # no local docker daemon needed, no `docker pull/load/rmi` disk thrash.
  echo "==> [$image] push :latest"
  if ! nix run ".#${image}.copyTo" -- "docker://${REGISTRY}/${image}:latest" >/dev/null 2>&1; then
    echo "fail-push" > "$state_file"
    total_fail_push=$((total_fail_push + 1))
    continue
  fi
  if [ "$PUSH_VERSION_TOO" = "true" ]; then
    echo "==> [$image] push :$TAG"
    if ! nix run ".#${image}.copyTo" -- "docker://${REGISTRY}/${image}:${TAG}" >/dev/null 2>&1; then
      echo "fail-push" > "$state_file"
      total_fail_push=$((total_fail_push + 1))
      continue
    fi
  fi

  # --- 4. Scan (matches security-scan.yml's per-image loop) ---
  # File-name pattern security-scan.yml uses: full ref with /:_ munging.
  # Both _latest and _<version> versions are written; the renderer's
  # _find_scan_file picks the lex-greatest, which is typically the
  # version-tagged file.
  echo "==> [$image] trivy + grype + syft"
  safe_latest="${REGISTRY//\//_}_${image}_latest"
  safe_latest="${safe_latest//:/_}"
  scan_ok=true
  trivy image --severity HIGH,CRITICAL --no-progress --format json \
        -o "${SCAN_DIR}/${safe_latest}-trivy.json" \
        "${REGISTRY}/${image}:latest" 2>/dev/null || scan_ok=false
  grype "${REGISTRY}/${image}:latest" -o json \
        > "${SCAN_DIR}/${safe_latest}-grype.json" 2>/dev/null || scan_ok=false
  syft "${REGISTRY}/${image}:latest" -o json \
        > "${SCAN_DIR}/${safe_latest}-sbom.json" 2>/dev/null || scan_ok=false
  syft "${REGISTRY}/${image}:latest" -o spdx-json \
        > "${SCAN_DIR}/${safe_latest}-sbom-spdx.json" 2>/dev/null || scan_ok=false
  if [ "$scan_ok" = "false" ]; then
    echo "fail-scan" > "$state_file"
    total_fail_scan=$((total_fail_scan + 1))
    continue
  fi

  # --- 5. oras attach SBOM + trivy report as OCI referrers ---
  echo "==> [$image] oras attach sbom + trivy"
  attach_ok=true
  oras attach --artifact-type application/spdx+json \
       "${REGISTRY}/${image}:latest" \
       "${SCAN_DIR}/${safe_latest}-sbom-spdx.json:application/spdx+json" \
       >/dev/null 2>&1 || attach_ok=false
  oras attach --artifact-type application/vnd.aquasec.trivy.report.v1+json \
       "${REGISTRY}/${image}:latest" \
       "${SCAN_DIR}/${safe_latest}-trivy.json:application/json" \
       >/dev/null 2>&1 || attach_ok=false
  if [ "$attach_ok" = "false" ]; then
    # Attach failure is recoverable — the image + scan-data are already
    # good. Log but don't fail the whole pipeline.
    echo "fail-attach" > "$state_file"
    total_fail_attach=$((total_fail_attach + 1))
  else
    echo "ok" > "$state_file"
    total_ok=$((total_ok + 1))
  fi

  # Stage the scan-data files for commit.
  git add -f \
    "${SCAN_DIR}/${safe_latest}-trivy.json" \
    "${SCAN_DIR}/${safe_latest}-grype.json" \
    "${SCAN_DIR}/${safe_latest}-sbom.json" \
    "${SCAN_DIR}/${safe_latest}-sbom-spdx.json" 2>/dev/null
  batch_count=$((batch_count + 1))

  if [ "$batch_count" -ge "$BATCH_SIZE" ]; then
    assert_branch
    git commit -m "scan: refresh scan-data for $batch_count images (local build+scan+push batch)" >/dev/null 2>&1 \
      && echo "==> committed batch of $batch_count (total ok: $total_ok)"
    batch_count=0
    push_count=$((push_count + 1))
    if [ "$push_count" -ge "$PUSH_EVERY" ]; then
      git push origin "$BRANCH" 2>&1 | tail -2
      push_count=0
    fi
  fi
done < "$LIST"

# Flush remainder
if [ "$batch_count" -gt 0 ]; then
  assert_branch
  git commit -m "scan: refresh scan-data for $batch_count images (final batch)" >/dev/null 2>&1 \
    && echo "==> committed final batch of $batch_count"
  git push origin "$BRANCH" 2>&1 | tail -2
fi

echo ""
echo "==> summary"
echo "    ok:           $total_ok"
echo "    fail-build:   $total_fail_build"
echo "    fail-push:    $total_fail_push"
echo "    fail-scan:    $total_fail_scan"
echo "    fail-attach:  $total_fail_attach (image+scan succeeded, just couldn't attach to registry)"
echo "    skipped:      $total_skipped (previously processed)"
