#!/usr/bin/env bash
set -uo pipefail

usage() {
  cat <<EOF
Usage: $0 <image-name>

Runs the per-image verification gate:
  1. nix build .#<image>
  2. make test-image IMAGE=<image>
  3. docker load via nix build .#load-<image>-to-docker
  4. trivy --severity HIGH,CRITICAL (zero allowed)
  5. grype --fail-on high (zero allowed)
  6. smoke test: docker run --rm <image>:<tag> --version (best-effort)

Writes audit-results/<image>.json with structured pass/fail data.
Exits 0 only if all five non-smoke checks pass.
EOF
}

if [ $# -lt 1 ]; then
  usage
  exit 2
fi

IMAGE="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

if [ ! -d "images/$IMAGE" ]; then
  echo "error: image not found at images/$IMAGE" >&2
  exit 3
fi

AUDIT_RESULTS_DIR="${AUDIT_RESULTS_DIR:-audit-results}"
mkdir -p "$AUDIT_RESULTS_DIR"
RESULT_FILE="$AUDIT_RESULTS_DIR/${IMAGE}.json"

# Helper: returns the status of the latest command (0 pass, 1 fail).
# We use a temp file for each step's output to keep stdout clean for the JSON emission.
declare -A STEPS

run_step() {
  local name="$1"; shift
  echo "==> [$IMAGE] step: $name"
  if "$@"; then
    STEPS[$name]=0
    echo "    [$IMAGE] $name OK"
  else
    STEPS[$name]=1
    echo "    [$IMAGE] $name FAILED" >&2
  fi
}

# 1. nix build
run_step nix_build nix build --no-link ".#${IMAGE}"

# 2. test-image (call the underlying script directly to avoid hard dep on `make`).
run_step make_test ./scripts/test-image-build.sh image "$IMAGE"

# 3. docker load — nix2container exposes `.#load-<name>-to-docker` whose binary is
# named `copy-to-docker-daemon` (not `load-<name>-to-docker`). Use a fresh result
# symlink scoped per image to avoid collisions if multiple images are verified
# in sequence.
echo "==> [$IMAGE] step: docker_load"
LOAD_LINK="./result-load-${IMAGE}"
rm -f "$LOAD_LINK"
if nix build --out-link "$LOAD_LINK" ".#load-${IMAGE}-to-docker" 2>/dev/null \
   && [ -x "${LOAD_LINK}/bin/copy-to-docker-daemon" ]; then
  if "${LOAD_LINK}/bin/copy-to-docker-daemon"; then
    STEPS[docker_load]=0
    echo "    [$IMAGE] docker_load OK"
  else
    STEPS[docker_load]=1
    echo "    [$IMAGE] docker_load FAILED (load script failed)" >&2
  fi
else
  STEPS[docker_load]=1
  echo "    [$IMAGE] docker_load FAILED (nix build .#load-* failed or no copy-to-docker-daemon)" >&2
fi

# Determine the loaded tag (best-effort).
IMAGE_REF=$(docker images --format '{{.Repository}}:{{.Tag}}' 2>/dev/null | grep -E "^${IMAGE}:" | head -1 || true)

# 4. trivy
echo "==> [$IMAGE] step: trivy"
if [ -n "${IMAGE_REF:-}" ]; then
  if trivy image --severity HIGH,CRITICAL --exit-code 1 --no-progress --quiet "$IMAGE_REF"; then
    STEPS[trivy]=0
    echo "    [$IMAGE] trivy OK"
  else
    STEPS[trivy]=1
    echo "    [$IMAGE] trivy FAILED (HIGH/CRITICAL CVEs)" >&2
  fi
else
  STEPS[trivy]=1
  echo "    [$IMAGE] trivy SKIPPED (no image ref); marked as failure" >&2
fi

# 5. grype
echo "==> [$IMAGE] step: grype"
if [ -n "${IMAGE_REF:-}" ]; then
  if grype "$IMAGE_REF" --fail-on high --quiet; then
    STEPS[grype]=0
    echo "    [$IMAGE] grype OK"
  else
    STEPS[grype]=1
    echo "    [$IMAGE] grype FAILED (HIGH+ CVEs)" >&2
  fi
else
  STEPS[grype]=1
  echo "    [$IMAGE] grype SKIPPED (no image ref); marked as failure" >&2
fi

# 6. smoke test (best-effort; informational)
echo "==> [$IMAGE] step: smoke"
if [ -n "${IMAGE_REF:-}" ] && docker run --rm "$IMAGE_REF" --version >/dev/null 2>&1; then
  STEPS[smoke]=0
  echo "    [$IMAGE] smoke OK"
else
  STEPS[smoke]=1
  echo "    [$IMAGE] smoke FAILED (informational only)" >&2
fi

# Overall: nix_build, make_test, docker_load, trivy, grype must all be 0.
overall=0
for k in nix_build make_test docker_load trivy grype; do
  if [ "${STEPS[$k]:-1}" -ne 0 ]; then overall=1; fi
done

# Emit JSON.
{
  printf '{\n'
  printf '  "image": "%s",\n' "$IMAGE"
  printf '  "image_ref": "%s",\n' "${IMAGE_REF:-}"
  printf '  "nix_build": %s,\n' "${STEPS[nix_build]:-1}"
  printf '  "make_test": %s,\n' "${STEPS[make_test]:-1}"
  printf '  "docker_load": %s,\n' "${STEPS[docker_load]:-1}"
  printf '  "trivy": %s,\n' "${STEPS[trivy]:-1}"
  printf '  "grype": %s,\n' "${STEPS[grype]:-1}"
  printf '  "smoke": %s,\n' "${STEPS[smoke]:-1}"
  printf '  "overall": %s\n' "$overall"
  printf '}\n'
} > "$RESULT_FILE"

echo "==> [$IMAGE] result: $RESULT_FILE (overall=$overall)"
exit $overall
