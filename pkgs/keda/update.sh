#!/usr/bin/env bash
# Update script for keda package
# Usage: ./update.sh [VERSION]
# If VERSION is not provided, fetches the latest stable version

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DEFAULT_NIX="$SCRIPT_DIR/default.nix"

# Source common functions
source "$REPO_ROOT/scripts/lib/go-update.sh"

OWNER="kedacore"
REPO="keda"

# Get version
if [[ $# -ge 1 ]]; then
    VERSION="$1"
else
    log_info "Fetching latest KEDA version from GitHub..."
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

# Step 3: Check if KEDA uses vendored deps (it does, so vendorHash = null)
# KEDA includes a vendor directory, so we just verify the build works
log_info "Step 3: KEDA uses vendored dependencies, verifying build..."

cd "$REPO_ROOT"

# Try a build with Lima (for Linux builds on macOS)
if command -v limactl &>/dev/null && limactl list 2>/dev/null | grep -q "Running"; then
    log_info "Building with Lima VM..."
    BUILD_OUTPUT=$(limactl shell default -- bash -c ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && nix build .#keda --print-build-logs -L" 2>&1 || true)
else
    log_info "Building locally..."
    BUILD_OUTPUT=$(nix build .#keda --print-build-logs -L 2>&1 || true)
fi

# Check for common errors
if echo "$BUILD_OUTPUT" | grep -q "go.mod requires go"; then
    log_error "Go version mismatch detected. You may need to downgrade KEDA version."
    log_error "Check: https://github.com/kedacore/keda/releases for Go requirements"
    exit 1
fi

if echo "$BUILD_OUTPUT" | grep -q "hash mismatch"; then
    log_error "Unexpected vendor hash issue. KEDA should have vendored deps."
    exit 1
fi

if echo "$BUILD_OUTPUT" | grep -q "error:"; then
    log_error "Build failed. Check output above."
    exit 1
fi

log_info "Successfully updated KEDA to version $VERSION"
echo ""
echo "Updated files:"
echo "  - $DEFAULT_NIX"
echo ""
echo "Don't forget to test the build and commit changes!"
