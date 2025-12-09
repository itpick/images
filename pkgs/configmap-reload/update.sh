#!/usr/bin/env bash
# Update script for configmap-reload package
# Usage: ./update.sh [VERSION]
# If VERSION is not provided, fetches the latest stable version

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DEFAULT_NIX="$SCRIPT_DIR/default.nix"

# Source common functions
source "$REPO_ROOT/scripts/lib/go-update.sh"

OWNER="jimmidyson"
REPO="configmap-reload"

# Get version
if [[ $# -ge 1 ]]; then
    VERSION="$1"
else
    log_info "Fetching latest configmap-reload version from GitHub..."
    VERSION=$(get_latest_github_release "$OWNER" "$REPO" "v")
fi

CURRENT_VERSION=$(get_current_version "$DEFAULT_NIX")

log_info "Current version: $CURRENT_VERSION"
log_info "Target version:  $VERSION"

if [[ "$CURRENT_VERSION" == "$VERSION" ]]; then
    log_info "Already at version $VERSION, nothing to do."
    exit 0
fi

# Step 1: Get source hash
log_info "Step 1: Fetching source hash..."
SOURCE_HASH=$(get_github_source_hash "$OWNER" "$REPO" "$VERSION")
log_info "Source hash: $SOURCE_HASH"

# Step 2: Update version and source hash in default.nix
log_info "Step 2: Updating version and source hash..."
update_nix_version "$DEFAULT_NIX" "$VERSION"
update_nix_hash "$DEFAULT_NIX" "$SOURCE_HASH"

# Step 3: Set vendorHash to placeholder
log_info "Step 3: Setting vendorHash placeholder..."
sed -i.bak 's|vendorHash = "sha256-[^"]*";|vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";|' "$DEFAULT_NIX"
rm -f "${DEFAULT_NIX}.bak"

# Step 4: Get real vendorHash
log_info "Step 4: Computing vendorHash..."

cd "$REPO_ROOT"

USE_LIMA="false"
if command -v limactl &>/dev/null && limactl list 2>/dev/null | grep -q "Running"; then
    USE_LIMA="true"
    log_info "Using Lima VM for builds..."
fi

VENDOR_HASH=$(get_vendor_hash "configmap-reload" "$USE_LIMA")
log_info "vendorHash: $VENDOR_HASH"

update_nix_vendor_hash "$DEFAULT_NIX" "$VENDOR_HASH"

# Step 5: Verify build
log_info "Step 5: Verifying build..."

if [[ "$USE_LIMA" == "true" ]]; then
    BUILD_OUTPUT=$(limactl shell default -- bash -c ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && nix build .#configmap-reload --print-build-logs -L" 2>&1 || true)
else
    BUILD_OUTPUT=$(nix build .#configmap-reload --print-build-logs -L 2>&1 || true)
fi

if echo "$BUILD_OUTPUT" | grep -q "error:"; then
    log_error "Build verification failed."
    exit 1
fi

log_info "Successfully updated configmap-reload to version $VERSION"
echo ""
echo "Updated files:"
echo "  - $DEFAULT_NIX"
