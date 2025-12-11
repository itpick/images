#!/usr/bin/env bash
# Remote build script for x86_64 Linux builds
# Uses SSH to build on remote NixOS machine

set -euo pipefail

REMOTE_HOST="lucaspick@192.168.72.110"
REMOTE_DIR="~/Downloads/nix-containers"
LOCAL_DIR="/Users/lucaspick/workspace/drduker/nix-containers"
SSH_CMD="/usr/bin/ssh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

OUTPUT_FILE="${LOCAL_DIR}/images/data-gathering/build-times.json"

usage() {
    echo "Usage: $0 <command> [args]"
    echo ""
    echo "Commands:"
    echo "  sync              Sync local changes to remote"
    echo "  build <image>     Build a single image"
    echo "  build-all         Build all non-placeholder images"
    echo "  build-timed       Build all images with timing (outputs JSON)"
    echo "  list              List available images"
    echo "  test <image>      Build and test an image"
    echo "  shell             Open SSH shell on remote"
    echo ""
    echo "Examples:"
    echo "  $0 sync"
    echo "  $0 build trivy"
    echo "  $0 build-all"
    echo "  $0 build-timed"
}

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

sync_to_remote() {
    log_info "Syncing local changes to remote..."
    rsync -avz --delete --exclude='.git' --exclude='result' --exclude='result-*' \
        "$LOCAL_DIR/" "$REMOTE_HOST:$REMOTE_DIR/"

    log_info "Adding files to git on remote (required for flakes)..."
    $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR && git add -A"

    log_info "Sync complete!"
}

build_image() {
    local image="$1"
    log_info "Building image: $image"

    $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix build .#$image --no-link --print-out-paths 2>&1"
}

build_all_images() {
    log_info "Finding all buildable images..."

    # Get list of images that don't have 'throw' (i.e., are implemented)
    local images
    images=$($SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images/images && grep -L 'throw' */default.nix 2>/dev/null | sed 's|/default.nix||' | sort")

    local total
    total=$(echo "$images" | wc -l | tr -d ' ')
    local count=0
    local failed=()
    local succeeded=()

    log_info "Found $total buildable images"

    for image in $images; do
        ((count++))
        echo ""
        log_info "[$count/$total] Building: $image"

        if $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix build .#$image --no-link 2>&1"; then
            succeeded+=("$image")
            log_info "✓ $image built successfully"
        else
            failed+=("$image")
            log_error "✗ $image failed to build"
        fi
    done

    echo ""
    echo "========================================"
    log_info "Build Summary"
    echo "========================================"
    echo "Succeeded: ${#succeeded[@]}"
    echo "Failed: ${#failed[@]}"

    if [ ${#failed[@]} -gt 0 ]; then
        echo ""
        log_error "Failed images:"
        for img in "${failed[@]}"; do
            echo "  - $img"
        done
    fi
}

build_timed_images() {
    log_info "Finding all buildable images..."

    # Get list of images that don't have 'throw' (i.e., are implemented)
    local images
    images=$($SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images/images && grep -L 'throw' */default.nix 2>/dev/null | sed 's|/default.nix||' | sort")

    local total
    total=$(echo "$images" | wc -l | tr -d ' ')
    local count=0
    local total_time=0

    # Start JSON output
    echo "{" > "$OUTPUT_FILE"
    echo '  "generated": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",' >> "$OUTPUT_FILE"
    echo '  "builder": "x86_64-linux (NixOS)",' >> "$OUTPUT_FILE"
    echo '  "images": {' >> "$OUTPUT_FILE"

    log_info "Found $total buildable images"
    local first=true

    for image in $images; do
        count=$((count + 1))
        echo ""
        log_info "[$count/$total] Building: $image"

        local start_time=$(date +%s)
        local status="success"
        local error_msg=""

        set +e
        output=$($SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix build .#$image --no-link 2>&1")
        local exit_code=$?
        set -e

        if [ $exit_code -ne 0 ]; then
            status="failed"
            error_msg=$(echo "$output" | tail -1 | sed 's/"/\\"/g')
            log_error "✗ $image failed to build"
        else
            log_info "✓ $image built successfully"
        fi

        local end_time=$(date +%s)
        local duration=$((end_time - start_time))
        total_time=$((total_time + duration))

        # Format duration as human readable
        local mins=$((duration / 60))
        local secs=$((duration % 60))
        local duration_str
        if [ $mins -gt 0 ]; then
            duration_str="${mins}m ${secs}s"
        else
            duration_str="${secs}s"
        fi

        log_info "Build time: $duration_str"

        # Add comma before entries except the first
        if [ "$first" = true ]; then
            first=false
        else
            echo "," >> "$OUTPUT_FILE"
        fi

        # Write JSON entry
        printf '    "%s": {"time_seconds": %d, "time_human": "%s", "status": "%s"' "$image" "$duration" "$duration_str" "$status" >> "$OUTPUT_FILE"
        if [ -n "$error_msg" ]; then
            printf ', "error": "%s"' "$error_msg" >> "$OUTPUT_FILE"
        fi
        printf '}' >> "$OUTPUT_FILE"
    done

    # Close JSON
    echo "" >> "$OUTPUT_FILE"
    echo "  }," >> "$OUTPUT_FILE"

    # Add totals
    local total_mins=$((total_time / 60))
    local total_secs=$((total_time % 60))
    local total_str="${total_mins}m ${total_secs}s"

    echo '  "total_time_seconds": '$total_time',' >> "$OUTPUT_FILE"
    echo '  "total_time_human": "'$total_str'",' >> "$OUTPUT_FILE"
    echo '  "total_images": '$total >> "$OUTPUT_FILE"
    echo "}" >> "$OUTPUT_FILE"

    echo ""
    echo "========================================"
    log_info "Build Summary"
    echo "========================================"
    echo "Total images: $total"
    echo "Total build time: $total_str"
    echo "Results saved to: $OUTPUT_FILE"
}

list_images() {
    log_info "Listing available images..."
    $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix flake show --json 2>/dev/null | jq -r '.packages.\"x86_64-linux\" | keys[]' 2>/dev/null | sort" || \
    $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images/images && ls -d */ | sed 's|/||'"
}

test_image() {
    local image="$1"
    log_info "Building and testing image: $image"

    # First build
    local result
    result=$($SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix build .#$image --no-link --print-out-paths 2>&1")

    if [ $? -eq 0 ]; then
        log_info "Build succeeded: $result"

        # Copy to docker and run
        log_info "Loading image into docker..."
        $SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix run .#$image.copyToDockerDaemon 2>/dev/null" || true

        log_info "Image ready for testing"
    else
        log_error "Build failed"
        echo "$result"
    fi
}

open_shell() {
    log_info "Opening SSH shell on remote..."
    $SSH_CMD -t "$REMOTE_HOST" "cd $REMOTE_DIR/images && exec \$SHELL -l"
}

# Main
case "${1:-}" in
    sync)
        sync_to_remote
        ;;
    build)
        if [ -z "${2:-}" ]; then
            log_error "Please specify an image name"
            usage
            exit 1
        fi
        build_image "$2"
        ;;
    build-all)
        build_all_images
        ;;
    build-timed)
        build_timed_images
        ;;
    list)
        list_images
        ;;
    test)
        if [ -z "${2:-}" ]; then
            log_error "Please specify an image name"
            usage
            exit 1
        fi
        test_image "$2"
        ;;
    shell)
        open_shell
        ;;
    *)
        usage
        exit 1
        ;;
esac
