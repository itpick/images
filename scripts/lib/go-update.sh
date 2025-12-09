#!/usr/bin/env bash
# Library functions for updating Go packages in Nix
# Source this in package-specific update scripts

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
log_error() { echo -e "${RED}[ERROR]${NC} $*"; }

# Get the repo root
get_repo_root() {
    git rev-parse --show-toplevel 2>/dev/null || echo "$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
}

# Fetch latest release version from GitHub
# Usage: get_latest_github_release owner repo [prefix]
# Example: get_latest_github_release kedacore keda v
get_latest_github_release() {
    local owner="$1"
    local repo="$2"
    local prefix="${3:-v}"

    local version
    version=$(curl -sL "https://api.github.com/repos/${owner}/${repo}/releases/latest" | \
        grep '"tag_name":' | \
        sed -E "s/.*\"${prefix}([^\"]+)\".*/\1/")

    if [[ -z "$version" ]]; then
        log_error "Could not fetch latest version for ${owner}/${repo}"
        return 1
    fi

    echo "$version"
}

# Get source hash for a GitHub release
# Usage: get_github_source_hash owner repo version
get_github_source_hash() {
    local owner="$1"
    local repo="$2"
    local version="$3"

    log_info "Fetching source hash for ${owner}/${repo} v${version}..."

    local hash
    hash=$(nix-prefetch-url --unpack "https://github.com/${owner}/${repo}/archive/v${version}.tar.gz" 2>&1 | tail -1)

    if [[ -z "$hash" ]] || [[ "$hash" == *"error"* ]]; then
        log_error "Failed to fetch source hash"
        return 1
    fi

    # Convert to SRI format
    nix --extra-experimental-features 'nix-command flakes' hash convert --hash-algo sha256 "$hash" 2>/dev/null || \
    nix hash to-sri --type sha256 "$hash" 2>/dev/null
}

# Get vendorHash by doing a test build with placeholder
# Usage: get_vendor_hash package_attr [lima]
# This builds with a fake hash, captures the error, and extracts the real hash
get_vendor_hash() {
    local package_attr="$1"
    local use_lima="${2:-false}"

    log_info "Computing vendorHash for ${package_attr}..."

    local build_output
    local build_cmd="nix build .#${package_attr} --print-build-logs -L 2>&1"

    if [[ "$use_lima" == "true" ]]; then
        build_output=$(limactl shell default -- bash -c ". /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && $build_cmd" 2>&1 || true)
    else
        build_output=$(eval "$build_cmd" 2>&1 || true)
    fi

    # Extract the "got:" hash from the error message
    local vendor_hash
    vendor_hash=$(echo "$build_output" | grep -A1 "hash mismatch" | grep "got:" | sed -E 's/.*got:\s+(sha256-[^[:space:]]+).*/\1/')

    if [[ -z "$vendor_hash" ]]; then
        # Check if it says vendor folder exists
        if echo "$build_output" | grep -q "vendor folder exists"; then
            echo "null"
            return 0
        fi
        log_error "Could not extract vendorHash from build output"
        return 1
    fi

    echo "$vendor_hash"
}

# Update version in a nix file
# Usage: update_nix_version file version
update_nix_version() {
    local file="$1"
    local version="$2"

    sed -i.bak "s/version = \"[^\"]*\";/version = \"${version}\";/" "$file"
    rm -f "${file}.bak"
}

# Update source hash in a nix file
# Usage: update_nix_hash file hash
update_nix_hash() {
    local file="$1"
    local hash="$2"

    sed -i.bak "s|hash = \"sha256-[^\"]*\";|hash = \"${hash}\";|" "$file"
    rm -f "${file}.bak"
}

# Update vendor hash in a nix file
# Usage: update_nix_vendor_hash file hash [field_name]
update_nix_vendor_hash() {
    local file="$1"
    local hash="$2"
    local field="${3:-vendorHash}"

    if [[ "$hash" == "null" ]]; then
        sed -i.bak "s|${field} = \"sha256-[^\"]*\";|${field} = null;|" "$file"
    else
        sed -i.bak "s|${field} = \"sha256-[^\"]*\";|${field} = \"${hash}\";|" "$file"
        # Also handle null -> hash
        sed -i.bak "s|${field} = null;|${field} = \"${hash}\";|" "$file"
    fi
    rm -f "${file}.bak"
}

# Check if a version is newer than current
# Usage: is_newer_version current new
is_newer_version() {
    local current="$1"
    local new="$2"

    if [[ "$current" == "$new" ]]; then
        return 1
    fi

    # Use sort -V for version comparison
    local older
    older=$(printf '%s\n%s' "$current" "$new" | sort -V | head -n1)
    [[ "$older" == "$current" ]]
}

# Get current version from a nix file
# Usage: get_current_version file
get_current_version() {
    local file="$1"
    grep 'version = "' "$file" | head -1 | sed -E 's/.*version = "([^"]+)".*/\1/'
}
