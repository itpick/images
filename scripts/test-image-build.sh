#!/usr/bin/env bash

# Direct image build testing script (without GitHub Actions)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[$(date +'%Y-%m-%d %H:%M:%S')] WARNING: $1${NC}"
}

error() {
    echo -e "${RED}[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: $1${NC}"
}

# Check if required tools are available
check_dependencies() {
    local missing_deps=()
    
    if ! command -v nix &> /dev/null; then
        missing_deps+=("nix")
    fi
    
    if ! command -v docker &> /dev/null; then
        missing_deps+=("docker")
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        error "Missing required dependencies: ${missing_deps[*]}"
        echo "Please install the missing dependencies:"
        for dep in "${missing_deps[@]}"; do
            case $dep in
                "nix")
                    echo "  - Nix: https://nixos.org/download.html"
                    ;;
                "docker")
                    echo "  - Docker: https://docs.docker.com/get-docker/"
                    ;;
            esac
        done
        exit 1
    fi
}

# Build specific image
build_image() {
    local image_name="$1"
    local image_path="images/$image_name"
    
    log "Building image: $image_name"
    
    # Check if image exists
    if [ ! -d "$image_path" ]; then
        error "Image directory $image_path does not exist"
        return 1
    fi
    
    if [ ! -f "$image_path/default.nix" ]; then
        error "Image $image_path/default.nix does not exist"
        return 1
    fi
    
    # Build with Nix
    log "Running nix build for $image_name..."
    if nix build ".#$image_name" --print-build-logs; then
        log "✅ Successfully built $image_name"
        
        # Load into Docker
        log "Loading image into Docker daemon..."
        if nix run ".#$image_name.copyTo" -- docker-daemon:"$image_name:test"; then
            log "✅ Successfully loaded $image_name into Docker"
            
            # Show image info
            log "Image information:"
            docker images | grep "$image_name" || warn "Image not found in docker images output"
            
            # Test basic functionality
            log "Testing image functionality..."
            if docker run --rm "$image_name:test" --version &>/dev/null || 
               docker run --rm "$image_name:test" --help &>/dev/null ||
               docker run --rm "$image_name:test" true &>/dev/null; then
                log "✅ Image $image_name appears to be functional"
            else
                warn "Could not verify image functionality with basic commands"
            fi
            
        else
            error "Failed to load $image_name into Docker"
            return 1
        fi
    else
        error "Failed to build $image_name"
        return 1
    fi
}

# Build all images
build_all_images() {
    log "Building all available images..."
    
    local success_count=0
    local fail_count=0
    local failed_images=()
    
    for dir in images/*/; do
        if [ -d "$dir" ] && [ -f "$dir/default.nix" ]; then
            image_name=$(basename "$dir")
            log "Building image: $image_name"
            
            if build_image "$image_name"; then
                ((success_count++))
                log "✅ $image_name build completed successfully"
            else
                ((fail_count++))
                failed_images+=("$image_name")
                error "❌ $image_name build failed"
            fi
            
            echo "----------------------------------------"
        fi
    done
    
    log "Build Summary:"
    echo "  ✅ Successful builds: $success_count"
    echo "  ❌ Failed builds: $fail_count"
    
    if [ $fail_count -gt 0 ]; then
        echo "  Failed images: ${failed_images[*]}"
        return 1
    fi
}

# List available images
list_images() {
    log "Available images:"
    for dir in images/*/; do
        if [ -d "$dir" ] && [ -f "$dir/default.nix" ]; then
            echo "  - $(basename "$dir")"
        fi
    done
}

# Clean up test artifacts
cleanup() {
    log "Cleaning up test artifacts..."
    
    # Remove nix build results
    rm -f result result-* || true
    
    # Remove test Docker images
    log "Removing test Docker images..."
    docker images --format "table {{.Repository}}:{{.Tag}}\t{{.ID}}" | grep ":test" | awk '{print $2}' | xargs -r docker rmi -f || true
    
    log "Cleanup completed"
}

# Main function
main() {
    cd "$PROJECT_ROOT"
    
    case "${1:-help}" in
        "all")
            check_dependencies
            build_all_images
            ;;
        "image")
            if [ -z "${2:-}" ]; then
                error "Please specify image name"
                exit 1
            fi
            check_dependencies
            build_image "$2"
            ;;
        "list")
            list_images
            ;;
        "cleanup")
            cleanup
            ;;
        "help"|"-h"|"--help")
            echo "Usage: $0 [COMMAND] [OPTIONS]"
            echo ""
            echo "Commands:"
            echo "  all                    Build and test all images"
            echo "  image <name>           Build and test specific image"
            echo "  list                   List available images"
            echo "  cleanup                Clean up test artifacts"
            echo "  help                   Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 all                 # Build all images"
            echo "  $0 image bash          # Build bash image"
            echo "  $0 list                # List available images"
            echo "  $0 cleanup             # Clean up test artifacts"
            ;;
        *)
            error "Unknown command: $1"
            echo "Use '$0 help' for usage information"
            exit 1
            ;;
    esac
}

main "$@"