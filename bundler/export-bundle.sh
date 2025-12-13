#!/usr/bin/env bash
# export-bundle.sh
# Export nix2container images to a portable docker-archive bundle
#
# Usage:
#   ./bundler/export-bundle.sh [output-dir] [image-list]
#
# Arguments:
#   output-dir  - Directory to create bundle in (default: /tmp/image-bundle)
#   image-list  - Image list file (default: bundler/bigbang.txt)
#
# This script must be run from the nix-containers/images directory (where flake.nix is)
# It requires a Linux system with nix installed (use Lima or SSH builder on macOS)

set -euo pipefail

OUTPUT_DIR="${1:-/tmp/image-bundle}"
LIST_FILE="${2:-bundler/bigbang.txt}"
BUNDLE_NAME="image-bundle"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Verify we're in a flake directory
if [[ ! -f "flake.nix" ]]; then
    log_error "flake.nix not found. Run this script from the images directory."
    exit 1
fi

if [[ ! -f "$LIST_FILE" ]]; then
    log_error "Image list not found: $LIST_FILE"
    exit 1
fi

# Get skopeo from nix2container (has nix: transport support)
log_info "Getting skopeo with nix: transport support..."
SKOPEO_PATHS=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>/dev/null)

# Find the path with the actual binary (not the man pages)
SKOPEO=""
for p in $SKOPEO_PATHS; do
    if [[ -x "$p/bin/skopeo" ]]; then
        SKOPEO="$p/bin/skopeo"
        break
    fi
done

if [[ -z "$SKOPEO" ]]; then
    log_error "Failed to get skopeo from nix2container"
    exit 1
fi
log_info "Using skopeo: $SKOPEO"

# Create output directories
mkdir -p "$OUTPUT_DIR/images"
IMAGES_DIR="$OUTPUT_DIR/images"

log_info "Exporting images to: $OUTPUT_DIR"
log_info "Reading image list from: $LIST_FILE"

# Count images
TOTAL_IMAGES=$(grep -v '^#' "$LIST_FILE" | grep -v '^$' | wc -l | tr -d ' ')
log_info "Total images to export: $TOTAL_IMAGES"

EXPORTED=0
FAILED=0
SKIPPED=0
FAILED_IMAGES=()
TOTAL_SIZE=0

while IFS= read -r IMAGE_NAME || [[ -n "$IMAGE_NAME" ]]; do
    # Skip empty lines and comments
    [[ -z "$IMAGE_NAME" || "$IMAGE_NAME" =~ ^# ]] && continue

    # Trim whitespace
    IMAGE_NAME=$(echo "$IMAGE_NAME" | xargs)

    CURRENT=$((EXPORTED + FAILED + SKIPPED + 1))
    TAR_FILE="$IMAGES_DIR/${IMAGE_NAME}.tar"

    # Skip if already exported
    if [[ -f "$TAR_FILE" ]]; then
        log_warn "[$CURRENT/$TOTAL_IMAGES] Skip: $IMAGE_NAME (exists)"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    log_info "[$CURRENT/$TOTAL_IMAGES] $IMAGE_NAME"

    # Build the image to get the JSON path
    IMAGE_JSON=$(nix build ".#${IMAGE_NAME}" --no-link --print-out-paths 2>/dev/null)
    if [[ -z "$IMAGE_JSON" ]] || [[ ! -f "$IMAGE_JSON" ]]; then
        log_error "  Failed to build"
        FAILED=$((FAILED + 1))
        FAILED_IMAGES+=("$IMAGE_NAME")
        continue
    fi

    # Export to docker-archive using skopeo
    if $SKOPEO copy --insecure-policy "nix:$IMAGE_JSON" "docker-archive:${TAR_FILE}:${IMAGE_NAME}:latest" 2>/dev/null; then
        SIZE=$(du -h "$TAR_FILE" | cut -f1)
        SIZE_BYTES=$(stat -c%s "$TAR_FILE" 2>/dev/null || stat -f%z "$TAR_FILE" 2>/dev/null || echo 0)
        TOTAL_SIZE=$((TOTAL_SIZE + SIZE_BYTES))
        log_info "  OK: $SIZE"
        EXPORTED=$((EXPORTED + 1))
    else
        log_error "  Failed to export"
        FAILED=$((FAILED + 1))
        FAILED_IMAGES+=("$IMAGE_NAME")
        rm -f "$TAR_FILE"
    fi
done < "$LIST_FILE"

echo ""
log_info "========================================"
log_info "Export Summary"
log_info "========================================"
log_info "Exported: $EXPORTED"
log_info "Skipped: $SKIPPED"
log_info "Failed: $FAILED"

if [[ $FAILED -gt 0 ]]; then
    log_warn "Failed images:"
    for img in "${FAILED_IMAGES[@]}"; do
        echo "  - $img"
    done
fi

# Detect platform
PLATFORM=$(uname -m)
if [[ "$PLATFORM" == "aarch64" ]]; then
    PLATFORM="aarch64-linux"
elif [[ "$PLATFORM" == "x86_64" ]]; then
    PLATFORM="x86_64-linux"
fi

# Create manifest
log_info "Creating manifest..."
cat > "$OUTPUT_DIR/manifest.json" << EOF
{
  "version": "1.0",
  "format": "docker-archive",
  "platform": "$PLATFORM",
  "created": "$(date -Iseconds)",
  "total_count": $EXPORTED,
  "total_size_bytes": $TOTAL_SIZE,
  "images": [
$(first=true; for f in "$IMAGES_DIR"/*.tar; do
    if [[ -f "$f" ]]; then
        name=$(basename "$f" .tar)
        size=$(stat -c%s "$f" 2>/dev/null || stat -f%z "$f")
        if [ "$first" = true ]; then first=false; else echo ","; fi
        printf '    {"name": "%s", "size": %s}' "$name" "$size"
    fi
done)
  ]
}
EOF

# Create README
cat > "$OUTPUT_DIR/README.txt" << EOF
Image Bundle
============
Platform: $PLATFORM
Format: docker-archive (one .tar per image)
Total Images: $EXPORTED
Created: $(date)

Usage:
------
1. Load all images into Docker:
   for f in images/*.tar; do
       echo "Loading \$(basename \$f .tar)..."
       docker load < "\$f"
   done

2. Load a single image:
   docker load < images/alertmanager.tar

3. Push to registry:
   skopeo copy docker-archive:images/alertmanager.tar docker://myregistry.com/alertmanager:latest
EOF

# Create compressed bundle
log_info "Creating compressed bundle..."
BUNDLE_FILE="${OUTPUT_DIR}/${BUNDLE_NAME}-${PLATFORM}.tar.gz"
tar -czvf "$BUNDLE_FILE" -C "$OUTPUT_DIR" images manifest.json README.txt 2>&1 | tail -3

FINAL_SIZE=$(du -h "$BUNDLE_FILE" | cut -f1)
log_info "========================================"
log_info "Bundle created: $BUNDLE_FILE"
log_info "Bundle size: $FINAL_SIZE"
log_info "========================================"

echo ""
echo "To use this bundle:"
echo "  1. Copy $(basename $BUNDLE_FILE) to target system"
echo "  2. tar -xzvf $(basename $BUNDLE_FILE)"
echo "  3. for f in images/*.tar; do docker load < \"\$f\"; done"
