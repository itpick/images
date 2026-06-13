#!/usr/bin/env bash
set -uo pipefail

AUDIT_PATH="${AUDIT_PATH:-docs/audits/cluster-image-audit.md}"
AUDIT_RESULTS_DIR="${AUDIT_RESULTS_DIR:-audit-results}"

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

if [ ! -f "$AUDIT_PATH" ]; then
  echo "error: audit doc not found at $AUDIT_PATH" >&2
  exit 1
fi

mkdir -p "$AUDIT_RESULTS_DIR"
SUMMARY="$AUDIT_RESULTS_DIR/SUMMARY.md"

{
  echo "# Audit Run Summary"
  echo ""
  echo "Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "Audit doc: \`$AUDIT_PATH\`"
  echo ""
  echo "| image | overall | nix_build | make_test | docker_load | trivy | grype | smoke |"
  echo "|---|---|---|---|---|---|---|---|"
} > "$SUMMARY"

# Parse the markdown table rows.
# - Field 4 is the nix-containers name
# - Field 7 is the status
# Skip header row, separator row, and rows where nix-containers name is empty or "—"
# Skip rows where status is not needs-bump / missing / extra.
mapfile -t IMAGES < <(
  awk -F'|' '
    BEGIN { in_table = 0 }
    /^\| *cluster image *\|/ { in_table = 1; next }
    /^\|-+\|-+/ { next }
    in_table && /^\|/ && NF >= 8 {
      name = $4
      status = $7
      gsub(/^[ \t]+|[ \t]+$/, "", name)
      gsub(/^[ \t]+|[ \t]+$/, "", status)
      if (status == "needs-bump" || status == "missing" || status == "extra") {
        if (name != "" && name != "—" && name != "nix-containers name") {
          print name
        }
      }
    }
  ' "$AUDIT_PATH" | sort -u
)

failures=0

for image in "${IMAGES[@]}"; do
  echo "==> Verifying $image"
  AUDIT_RESULTS_DIR="$AUDIT_RESULTS_DIR" ./scripts/verify-image.sh "$image" || true
  RESULT_FILE="$AUDIT_RESULTS_DIR/${image}.json"
  if [ -f "$RESULT_FILE" ]; then
    overall=$(grep -oE '"overall":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    nb=$(grep -oE '"nix_build":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    mt=$(grep -oE '"make_test":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    dl=$(grep -oE '"docker_load":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    tv=$(grep -oE '"trivy":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    gr=$(grep -oE '"grype":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    sm=$(grep -oE '"smoke":[[:space:]]*[0-9]+' "$RESULT_FILE" | grep -oE '[0-9]+$' | head -1)
    printf '| %s | %s | %s | %s | %s | %s | %s | %s |\n' \
      "$image" "${overall:-?}" "${nb:-?}" "${mt:-?}" "${dl:-?}" "${tv:-?}" "${gr:-?}" "${sm:-?}" >> "$SUMMARY"
    if [ "${overall:-1}" != "0" ]; then
      failures=$((failures + 1))
    fi
  else
    printf '| %s | (no result file) | - | - | - | - | - | - |\n' "$image" >> "$SUMMARY"
    failures=$((failures + 1))
  fi
done

if [ "$failures" -gt 0 ]; then
  echo "verify-all-cluster-images: $failures FAILURE(S); see $SUMMARY" >&2
  exit 1
fi

echo "verify-all-cluster-images: all ${#IMAGES[@]} processed images passed; see $SUMMARY"
exit 0
