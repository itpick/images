#!/usr/bin/env bash
# Master update script for all packages
# Usage: ./update-all-packages.sh [--check-only] [--package NAME] [--parallel]
#
# Options:
#   --check-only    Only check for updates, don't apply them
#   --package NAME  Update only the specified package
#   --parallel      Run updates in parallel (faster but harder to debug)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Source common functions
source "$SCRIPT_DIR/lib/go-update.sh"

# All packages with update scripts
declare -A PACKAGES=(
    ["keda"]="kedacore/keda"
    ["cert-manager"]="cert-manager/cert-manager"
    ["kube-rbac-proxy"]="brancz/kube-rbac-proxy"
    ["configmap-reload"]="jimmidyson/configmap-reload"
    ["cloudnative-pg"]="cloudnative-pg/cloudnative-pg"
)

CHECK_ONLY=false
PARALLEL=false
SINGLE_PACKAGE=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --check-only)
            CHECK_ONLY=true
            shift
            ;;
        --package)
            SINGLE_PACKAGE="$2"
            shift 2
            ;;
        --parallel)
            PARALLEL=true
            shift
            ;;
        *)
            log_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Function to check for updates for a package
check_package_update() {
    local package="$1"
    local repo="${PACKAGES[$package]}"
    local owner="${repo%/*}"
    local repo_name="${repo#*/}"
    local pkg_dir="$REPO_ROOT/pkgs/$package"
    local default_nix="$pkg_dir/default.nix"

    if [[ ! -f "$default_nix" ]]; then
        log_warn "Package $package not found at $default_nix"
        return 1
    fi

    local current_version
    current_version=$(get_current_version "$default_nix")

    local latest_version
    latest_version=$(get_latest_github_release "$owner" "$repo_name" "v" 2>/dev/null || echo "error")

    if [[ "$latest_version" == "error" ]]; then
        log_error "Failed to fetch latest version for $package"
        return 1
    fi

    if [[ "$current_version" == "$latest_version" ]]; then
        echo "$package: $current_version (up to date)"
        return 0
    else
        echo "$package: $current_version -> $latest_version (update available)"
        return 2
    fi
}

# Function to update a package
update_package() {
    local package="$1"
    local pkg_dir="$REPO_ROOT/pkgs/$package"
    local update_script="$pkg_dir/update.sh"

    if [[ ! -x "$update_script" ]]; then
        log_warn "No update script for $package"
        return 1
    fi

    log_info "Updating $package..."
    (cd "$pkg_dir" && bash update.sh)
}

# Main logic
echo "=========================================="
echo "Package Update Check"
echo "=========================================="
echo ""

UPDATES_AVAILABLE=()
ERRORS=()

if [[ -n "$SINGLE_PACKAGE" ]]; then
    if [[ -z "${PACKAGES[$SINGLE_PACKAGE]:-}" ]]; then
        log_error "Unknown package: $SINGLE_PACKAGE"
        echo "Available packages: ${!PACKAGES[*]}"
        exit 1
    fi
    PACKAGE_LIST=("$SINGLE_PACKAGE")
else
    PACKAGE_LIST=("${!PACKAGES[@]}")
fi

for package in "${PACKAGE_LIST[@]}"; do
    result=0
    check_package_update "$package" || result=$?

    if [[ $result -eq 2 ]]; then
        UPDATES_AVAILABLE+=("$package")
    elif [[ $result -eq 1 ]]; then
        ERRORS+=("$package")
    fi
done

echo ""
echo "=========================================="
echo "Summary"
echo "=========================================="

if [[ ${#UPDATES_AVAILABLE[@]} -eq 0 ]]; then
    echo "All packages are up to date!"
else
    echo "Updates available for: ${UPDATES_AVAILABLE[*]}"
fi

if [[ ${#ERRORS[@]} -gt 0 ]]; then
    echo "Errors checking: ${ERRORS[*]}"
fi

if [[ "$CHECK_ONLY" == "true" ]]; then
    echo ""
    echo "Run without --check-only to apply updates."
    exit 0
fi

if [[ ${#UPDATES_AVAILABLE[@]} -eq 0 ]]; then
    exit 0
fi

echo ""
echo "=========================================="
echo "Applying Updates"
echo "=========================================="

if [[ "$PARALLEL" == "true" ]]; then
    log_info "Running updates in parallel..."
    for package in "${UPDATES_AVAILABLE[@]}"; do
        update_package "$package" &
    done
    wait
else
    for package in "${UPDATES_AVAILABLE[@]}"; do
        update_package "$package"
        echo ""
    done
fi

echo ""
echo "=========================================="
echo "Update Complete"
echo "=========================================="
echo ""
echo "Don't forget to:"
echo "  1. Review the changes: git diff"
echo "  2. Test the builds: nix build .#<package>"
echo "  3. Commit changes: git add -A && git commit -m 'chore: update packages'"
