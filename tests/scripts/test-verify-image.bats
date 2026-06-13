#!/usr/bin/env bats

setup() {
  REPO_ROOT="$(git rev-parse --show-toplevel)"
  cd "$REPO_ROOT"
}

@test "verify-image.sh exits non-zero when no image name given" {
  run scripts/verify-image.sh
  [ "$status" -ne 0 ]
  [[ "$output" == *"usage:"* || "$output" == *"Usage:"* ]]
}

@test "verify-image.sh exits non-zero for unknown image" {
  run scripts/verify-image.sh definitely-does-not-exist-xxxxx
  [ "$status" -ne 0 ]
  [[ "$output" == *"not found"* || "$output" == *"unknown image"* ]]
}

@test "verify-image.sh writes a result JSON to audit-results/<name>.json on success" {
  rm -rf audit-results
  run scripts/verify-image.sh static
  # We don't assert on the exit code here — the static image may pass or fail.
  # We DO assert the result file exists.
  [ -f "audit-results/static.json" ]
}

@test "verify-image.sh result JSON contains required keys" {
  rm -rf audit-results
  run scripts/verify-image.sh static
  cat audit-results/static.json
  grep -q '"image":' audit-results/static.json
  grep -q '"nix_build":' audit-results/static.json
  grep -q '"docker_load":' audit-results/static.json
  grep -q '"trivy":' audit-results/static.json
  grep -q '"grype":' audit-results/static.json
  grep -q '"overall":' audit-results/static.json
}
