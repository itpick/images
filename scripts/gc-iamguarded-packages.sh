#!/usr/bin/env bash
# gc-iamguarded-packages.sh — delete legacy -iamguarded container packages from GHCR
#
# After PR #358 renamed -iamguarded → -nixchart images in the repo and
# deleted 51 unused stubs, the corresponding GHCR packages (both renamed-
# away and truly-removed) still exist under the org's Packages page.
# CI won't push new tags to them, but they linger indefinitely until
# explicitly deleted.
#
# Requires:
#   - gh authenticated with delete:packages,read:packages scope
#     (refresh with: gh auth refresh -s delete:packages,read:packages -h github.com)
#   - jq
#
# Dry run by default (lists what would be deleted). Pass --delete to
# actually issue the DELETE requests. Idempotent — re-runs are no-ops.
set -euo pipefail

ORG="nix-containers"
DELETE="${DELETE:-false}"
while [ $# -gt 0 ]; do
  case "$1" in
    --delete) DELETE=true; shift ;;
    -h|--help)
      echo "Usage: $0 [--delete]"; echo "Set DELETE=true or pass --delete to actually delete."
      exit 0 ;;
    *) echo "unknown arg: $1"; exit 1 ;;
  esac
done

# List all container packages for the org, filter to those with 'iamguarded'
# in the name. GH API paginates at 100/page; --paginate handles that.
packages=$(gh api "orgs/$ORG/packages?package_type=container&per_page=100" --paginate \
  | jq -r '.[] | select(.name | contains("iamguarded")) | .name')

count=$(echo "$packages" | grep -c . || true)
echo "Found $count iamguarded container packages under $ORG."

if [ "$count" -eq 0 ]; then
  echo "Nothing to do."
  exit 0
fi

if [ "$DELETE" != "true" ]; then
  echo ""
  echo "=== Dry run — would delete: ==="
  echo "$packages"
  echo ""
  echo "Re-run with --delete to actually delete."
  exit 0
fi

echo ""
echo "=== Deleting $count packages ==="
failed=0
while read -r pkg; do
  [ -z "$pkg" ] && continue
  # Path-encode the package name for slashes (there shouldn't be any but be safe).
  enc=$(printf %s "$pkg" | jq -sRr @uri)
  if gh api -X DELETE "orgs/$ORG/packages/container/$enc" >/dev/null 2>&1; then
    echo "  ✓ deleted $pkg"
  else
    echo "  ✗ failed  $pkg"
    failed=$((failed + 1))
  fi
done <<< "$packages"

if [ "$failed" -gt 0 ]; then
  echo ""
  echo "$failed deletes failed. Check auth scopes (delete:packages needed)."
  exit 1
fi
