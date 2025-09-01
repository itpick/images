#!/bin/bash

# Local testing script for GitHub Actions workflows using act

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}"
}

error() {
    echo -e "${RED}[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}"
}

# Check if act is installed
check_act_installed() {
    if ! command -v act &> /dev/null; then
        error "act is not installed. Please install it first:"
        echo "  - GitHub: https://github.com/nektos/act"
        echo "  - macOS: brew install act"
        echo "  - Linux: Download from GitHub releases"
        exit 1
    fi
    log "act version: $(act --version)"
}

# Test individual workflow
test_workflow() {
    local workflow_file="$1"
    local event_type="${2:-push}"
    local event_file=".github/act/${event_type}.json"
    
    log "Testing workflow: $workflow_file with event: $event_type"
    
    if [ ! -f "$event_file" ]; then
        warn "Event file $event_file not found, using default event"
        act -W "$workflow_file" --dry-run
    else
        act -W "$workflow_file" --eventpath "$event_file" --dry-run
    fi
}

# Test all workflows
test_all_workflows() {
    log "Testing all workflows with dry run..."
    
    # Test main workflow
    test_workflow ".github/workflows/build-containers.yml" "push"
    
    # Test individual job workflows (these are called by main, so dry run only)
    log "Validating individual job workflows..."
    act --list -W ".github/workflows/discover-images.yml" || warn "discover-images.yml validation failed"
    act --list -W ".github/workflows/build-and-push.yml" || warn "build-and-push.yml validation failed"
    act --list -W ".github/workflows/check-package-updates.yml" || warn "check-package-updates.yml validation failed"
    act --list -W ".github/workflows/security-scan.yml" || warn "security-scan.yml validation failed"
}

# Test specific image build
test_image_build() {
    local image_name="$1"
    
    log "Testing build for specific image: $image_name"
    
    # Check if image exists
    if [ ! -d "images/$image_name" ]; then
        error "Image directory images/$image_name does not exist"
        return 1
    fi
    
    if [ ! -f "images/$image_name/default.nix" ]; then
        error "Image images/$image_name/default.nix does not exist"
        return 1
    fi
    
    # Run act with specific matrix
    cat > .github/act/test-matrix.json << EOF
{
  "ref": "refs/heads/main",
  "repository": {
    "name": "nix-containers",
    "full_name": "test/nix-containers"
  },
  "inputs": {
    "matrix": "{\"include\":[{\"name\":\"$image_name\",\"path\":\"images/$image_name/\"}]}"
  }
}
EOF
    
    log "Running act for image: $image_name"
    act -W .github/workflows/build-and-push.yml --eventpath .github/act/test-matrix.json
}

# Main function
main() {
    cd "$PROJECT_ROOT"
    
    check_act_installed
    
    case "${1:-all}" in
        "all")
            test_all_workflows
            ;;
        "workflow")
            if [ -z "${2:-}" ]; then
                error "Please specify workflow file"
                exit 1
            fi
            test_workflow "$2" "${3:-push}"
            ;;
        "image")
            if [ -z "${2:-}" ]; then
                error "Please specify image name"
                exit 1
            fi
            test_image_build "$2"
            ;;
        "list")
            log "Available images:"
            for dir in images/*/; do
                if [ -d "$dir" ] && [ -f "$dir/default.nix" ]; then
                    echo "  - $(basename "$dir")"
                fi
            done
            ;;
        "help"|"-h"|"--help")
            echo "Usage: $0 [COMMAND] [OPTIONS]"
            echo ""
            echo "Commands:"
            echo "  all                    Test all workflows (dry run)"
            echo "  workflow <file> [event] Test specific workflow file"
            echo "  image <name>           Test build for specific image"
            echo "  list                   List available images"
            echo "  help                   Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 all                 # Test all workflows"
            echo "  $0 image bash          # Test bash image build"
            echo "  $0 workflow .github/workflows/build-containers.yml push"
            ;;
        *)
            error "Unknown command: $1"
            echo "Use '$0 help' for usage information"
            exit 1
            ;;
    esac
}

main "$@"