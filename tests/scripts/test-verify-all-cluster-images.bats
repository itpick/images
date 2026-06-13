#!/usr/bin/env bats

setup() {
  REPO_ROOT="$(git rev-parse --show-toplevel)"
  cd "$REPO_ROOT"
  TMP_AUDIT="$(mktemp -t audit-XXXX.md)"
  export AUDIT_PATH="$TMP_AUDIT"
}

teardown() {
  rm -f "$AUDIT_PATH"
  rm -rf audit-results-test
}

@test "verify-all exits non-zero when AUDIT_PATH points at missing file" {
  AUDIT_PATH=/no/such/file AUDIT_RESULTS_DIR=audit-results-test run scripts/verify-all-cluster-images.sh
  [ "$status" -ne 0 ]
}

@test "verify-all skips out-of-scope/deferred/up-to-date rows" {
  cat > "$AUDIT_PATH" <<EOF
| cluster image | cluster tag | nix-containers name | nix-containers ver | upstream latest | status | action |
|---|---|---|---|---|---|---|
| gke-release/foo | v1 | — | — | — | out-of-scope | skip |
| internal-registry/agility | 0.0.50 | — | — | — | deferred | skip |
| ghcr.io/fluxcd/helm-controller | v1.4.5 | helm-controller | 1.4.5 | 1.4.5 | up-to-date | none |
EOF
  AUDIT_RESULTS_DIR=audit-results-test run scripts/verify-all-cluster-images.sh
  # All rows are skipped. The script should produce a SUMMARY.md (possibly empty
  # of data rows) and exit zero.
  [ "$status" -eq 0 ]
  [ -f audit-results-test/SUMMARY.md ]
}

@test "verify-all writes SUMMARY.md with one row per processed image" {
  cat > "$AUDIT_PATH" <<EOF
| cluster image | cluster tag | nix-containers name | nix-containers ver | upstream latest | status | action |
|---|---|---|---|---|---|---|
| nix-containers/static | latest | static | n/a | n/a | needs-bump | force-process |
EOF
  AUDIT_RESULTS_DIR=audit-results-test run scripts/verify-all-cluster-images.sh
  # The script's exit code depends on whether static verifies successfully;
  # we only assert the SUMMARY contains the processed image's name as a row.
  grep -q '| static |' audit-results-test/SUMMARY.md
}
