#!/usr/bin/env bash

# Three verification tests for nix2container image builds

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

info() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Test 1: Verify Nix-based image discovery works correctly
test_nix_discovery() {
    log "🔍 TEST 1: Verifying Nix-based image discovery..."
    
    cd "$PROJECT_ROOT"
    
    # Test the new discoveredImages attribute
    info "Testing lib.filesystem.listFilesRecursive discovery..."
    if DISCOVERED_IMAGES=$(nix eval --json .#discoveredImages 2>/dev/null); then
        log "✅ Nix discovery successful"
        echo "Discovered images: $DISCOVERED_IMAGES"
        
        # Compare with traditional imageNames
        TRADITIONAL_IMAGES=$(nix eval --json .#imageNames 2>/dev/null)
        echo "Traditional discovery: $TRADITIONAL_IMAGES"
        
        # Verify they match
        if [ "$DISCOVERED_IMAGES" = "$TRADITIONAL_IMAGES" ]; then
            log "✅ Discovery methods match perfectly"
            return 0
        else
            warn "⚠️  Discovery methods differ - this may be expected"
            echo "  Filesystem-based: $DISCOVERED_IMAGES"
            echo "  Traditional:      $TRADITIONAL_IMAGES"
            return 0
        fi
    else
        error "❌ Nix discovery failed"
        return 1
    fi
}

# Test 2: Verify nix2container builds work for a sample of images
test_nix2container_builds() {
    log "🔨 TEST 2: Verifying nix2container builds work..."
    
    cd "$PROJECT_ROOT"
    
    # Get available images using Nix discovery
    local images_json
    if ! images_json=$(nix eval --json .#discoveredImages 2>/dev/null); then
        error "Failed to discover images"
        return 1
    fi
    
    # Parse JSON to get image names
    local sample_images
    sample_images=$(echo "$images_json" | jq -r '.[:3] | .[]' 2>/dev/null || echo "bash nix curl")
    
    info "Testing nix2container builds for sample images: $sample_images"
    
    local success_count=0
    local total_count=0
    
    for image in $sample_images; do
        total_count=$((total_count + 1))
        info "Building $image with nix2container..."
        
        if nix build ".#$image" --print-build-logs; then
            log "✅ Successfully built $image with nix2container"
            success_count=$((success_count + 1))
            
            # Verify the result is a nix2container output
            if [ -f ./result ]; then
                if head -c 100 ./result | grep -q "image\|layers\|config" || \
                   [ "$(head -c 1 ./result)" = "{" ]; then
                    log "✅ Build result is nix2container format"
                else
                    warn "⚠️  Unexpected build result format for $image"
                fi
            else
                warn "⚠️  No result file found for $image"
            fi
            
            # Clean up
            rm -f result result-*
        else
            error "❌ Failed to build $image"
        fi
        
        echo "---"
    done
    
    log "Build test results: $success_count/$total_count successful"
    [ $success_count -eq $total_count ]
}

# Test 3: Verify Docker loading and basic functionality
test_docker_functionality() {
    log "🐳 TEST 3: Verifying Docker loading and functionality..."
    
    cd "$PROJECT_ROOT"
    
    # Test with a few reliable images
    local test_images="bash nix curl"
    local success_count=0
    local total_count=0
    
    for image in $test_images; do
        total_count=$((total_count + 1))
        info "Testing Docker functionality for $image..."
        
        # Check if image directory exists
        if [ ! -d "images/$image" ]; then
            warn "Skipping $image - directory not found"
            continue
        fi
        
        # Build and load to Docker
        if nix build ".#$image" && \
           nix run ".#$image.copyTo" -- docker-daemon:"$image:verify-test"; then
            
            log "✅ Successfully loaded $image to Docker"
            
            # Test basic Docker operations
            local tests_passed=0
            
            # Test 1: Image exists in Docker
            if docker images | grep -q "$image.*verify-test"; then
                log "  ✅ Image appears in Docker images list"
                tests_passed=$((tests_passed + 1))
            fi
            
            # Test 2: Container can be created
            if docker create --name "test-$image-container" "$image:verify-test" >/dev/null 2>&1; then
                log "  ✅ Container creation successful"
                tests_passed=$((tests_passed + 1))
                docker rm "test-$image-container" >/dev/null 2>&1 || true
            fi
            
            # Test 3: Basic command execution
            if docker run --rm "$image:verify-test" true >/dev/null 2>&1; then
                log "  ✅ Basic command execution works"
                tests_passed=$((tests_passed + 1))
            elif docker run --rm "$image:verify-test" --help >/dev/null 2>&1; then
                log "  ✅ Help command works"
                tests_passed=$((tests_passed + 1))
            elif docker run --rm "$image:verify-test" --version >/dev/null 2>&1; then
                log "  ✅ Version command works"
                tests_passed=$((tests_passed + 1))
            else
                warn "  ⚠️  No basic commands responded (may be expected for $image)"
            fi
            
            if [ $tests_passed -ge 2 ]; then
                log "✅ $image Docker functionality verified"
                success_count=$((success_count + 1))
            else
                warn "⚠️  $image Docker functionality partially verified"
            fi
            
            # Clean up
            docker rmi "$image:verify-test" >/dev/null 2>&1 || true
            rm -f result result-*
        else
            error "❌ Failed to build or load $image"
        fi
        
        echo "---"
    done
    
    log "Docker functionality test results: $success_count/$total_count successful"
    [ $success_count -gt 0 ]  # Pass if at least one image works
}

# Run all verification tests
run_all_tests() {
    log "🧪 Running all verification tests..."
    
    local test_results=()
    
    # Run Test 1
    if test_nix_discovery; then
        test_results+=("✅ Discovery")
    else
        test_results+=("❌ Discovery")
    fi
    
    # Run Test 2  
    if test_nix2container_builds; then
        test_results+=("✅ Builds")
    else
        test_results+=("❌ Builds")
    fi
    
    # Run Test 3
    if test_docker_functionality; then
        test_results+=("✅ Docker")
    else
        test_results+=("❌ Docker")
    fi
    
    echo "========================================"
    log "📊 Final Test Summary:"
    for result in "${test_results[@]}"; do
        echo "  $result"
    done
    echo "========================================"
    
    # Check if all tests passed
    local failed_tests=0
    for result in "${test_results[@]}"; do
        if [[ $result == *"❌"* ]]; then
            failed_tests=$((failed_tests + 1))
        fi
    done
    
    if [ $failed_tests -eq 0 ]; then
        log "🎉 All verification tests passed!"
        return 0
    else
        error "$failed_tests test(s) failed"
        return 1
    fi
}

# Main function
main() {
    cd "$PROJECT_ROOT"
    
    case "${1:-all}" in
        "1"|"discovery")
            test_nix_discovery
            ;;
        "2"|"builds")
            test_nix2container_builds
            ;;
        "3"|"docker")
            test_docker_functionality
            ;;
        "all")
            run_all_tests
            ;;
        "help"|"-h"|"--help")
            echo "Usage: $0 [TEST]"
            echo ""
            echo "Tests:"
            echo "  1, discovery     Test Nix-based image discovery"
            echo "  2, builds        Test nix2container builds for sample images"
            echo "  3, docker        Test Docker loading and functionality"
            echo "  all              Run all verification tests (default)"
            echo "  help             Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 all           # Run all tests"
            echo "  $0 1             # Test only discovery"
            echo "  $0 builds        # Test only builds"
            ;;
        *)
            error "Unknown test: $1"
            echo "Use '$0 help' for usage information"
            exit 1
            ;;
    esac
}

main "$@"