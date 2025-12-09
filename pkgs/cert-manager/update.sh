#!/usr/bin/env bash
# Update script for cert-manager package
# Usage: ./update.sh [VERSION]
# If VERSION is not provided, fetches the latest stable version
#
# NOTE: cert-manager uses a multi-module structure with 4 components,
# each with its own vendorHash. This script updates all of them.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DEFAULT_NIX="$SCRIPT_DIR/default.nix"

# Source common functions
source "$REPO_ROOT/scripts/lib/go-update.sh"

OWNER="cert-manager"
REPO="cert-manager"

# Components that need separate vendorHash updates
COMPONENTS=("controller" "cainjector" "webhook" "acmesolver")

# Get version
if [[ $# -ge 1 ]]; then
    VERSION="$1"
else
    log_info "Fetching latest cert-manager version from GitHub..."
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

# Step 3: Set all vendorHashes to placeholder for computation
log_info "Step 3: Setting vendorHash placeholders..."
for component in "${COMPONENTS[@]}"; do
    # Replace vendorHash with a placeholder that will cause a hash mismatch
    sed -i.bak "s|vendorHash = \"sha256-[^\"]*\";|vendorHash = \"sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=\";|" "$DEFAULT_NIX"
done
rm -f "${DEFAULT_NIX}.bak"

# Step 4: Compute vendorHash for each component
log_info "Step 4: Computing vendorHashes for each component..."

cd "$REPO_ROOT"

# Check if Lima is available
USE_LIMA="false"
if command -v limactl &>/dev/null && limactl list 2>/dev/null | grep -q "Running"; then
    USE_LIMA="true"
    log_info "Using Lima VM for builds..."
fi

# Function to update a specific component's vendorHash
update_component_vendor_hash() {
    local component="$1"
    local attr="cert-manager.${component}"

    log_info "Computing vendorHash for ${component}..."

    local vendor_hash
    vendor_hash=$(get_vendor_hash "$attr" "$USE_LIMA")

    if [[ -z "$vendor_hash" ]]; then
        log_error "Failed to get vendorHash for ${component}"
        return 1
    fi

    log_info "${component} vendorHash: $vendor_hash"

    # Update the specific component's vendorHash in the file
    # We need to match the specific block for this component
    # Using a more targeted approach with a temp file

    local temp_file
    temp_file=$(mktemp)

    # Use awk to find the component block and update only that vendorHash
    awk -v component="$component" -v hash="$vendor_hash" '
    BEGIN { in_component = 0; done = 0 }
    /^  '"$component"' = buildGoModule/ { in_component = 1 }
    in_component && /vendorHash = / && !done {
        if (hash == "null") {
            sub(/vendorHash = "[^"]*";/, "vendorHash = null;")
        } else {
            sub(/vendorHash = "[^"]*";/, "vendorHash = \"" hash "\";")
        }
        done = 1
    }
    /^  });/ && in_component { in_component = 0 }
    { print }
    ' "$DEFAULT_NIX" > "$temp_file"

    mv "$temp_file" "$DEFAULT_NIX"
}

# Update each component sequentially
for component in "${COMPONENTS[@]}"; do
    if ! update_component_vendor_hash "$component"; then
        log_error "Failed to update ${component}, aborting."
        exit 1
    fi
done

# Step 5: Verify the build works
log_info "Step 5: Verifying full cert-manager build..."

if [[ "$USE_LIMA" == "true" ]]; then
    BUILD_OUTPUT=$(limactl shell default -- bash -c ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && nix build .#cert-manager --print-build-logs -L" 2>&1 || true)
else
    BUILD_OUTPUT=$(nix build .#cert-manager --print-build-logs -L 2>&1 || true)
fi

if echo "$BUILD_OUTPUT" | grep -q "error:"; then
    log_error "Build verification failed. Check output above."
    exit 1
fi

log_info "Successfully updated cert-manager to version $VERSION"
echo ""
echo "Updated files:"
echo "  - $DEFAULT_NIX"
echo ""
echo "Don't forget to test the build and commit changes!"
