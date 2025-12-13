#!/usr/bin/env bash
# export-bigbang-bundle.sh
# Export BigBang images to a portable OCI bundle
#
# This script builds each image and exports it to docker-archive format,
# then combines them into a single tarball bundle.
#
# Usage:
#   ./scripts/export-bigbang-bundle.sh [output-dir] [list-file]
#
# Arguments:
#   output-dir  - Directory to create bundle in (default: ./bigbang-bundle-output)
#   list-file   - Image list file (default: bigbang.txt)
#
# The output bundle can be loaded with:
#   for f in images/*.tar; do docker load < "$f"; done

set -euo pipefail

OUTPUT_DIR="${1:-./bigbang-bundle-output}"
LIST_FILE="${2:-bigbang.txt}"
BUNDLE_NAME="bigbang-bundle"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

if [[ ! -f "$LIST_FILE" ]]; then
    log_error "List file not found: $LIST_FILE"
    exit 1
fi

# Create output directories
mkdir -p "$OUTPUT_DIR/images"
IMAGES_DIR="$OUTPUT_DIR/images"

log_info "Exporting BigBang images to: $OUTPUT_DIR"
log_info "Reading image list from: $LIST_FILE"

# Count images
TOTAL_IMAGES=$(grep -v '^#' "$LIST_FILE" | grep -v '^$' | wc -l | tr -d ' ')
log_info "Total images to export: $TOTAL_IMAGES"

EXPORTED=0
FAILED=0
SKIPPED=0
FAILED_IMAGES=()

while IFS= read -r IMAGE_NAME || [[ -n "$IMAGE_NAME" ]]; do
    # Skip empty lines and comments
    [[ -z "$IMAGE_NAME" || "$IMAGE_NAME" =~ ^# ]] && continue

    # Trim whitespace
    IMAGE_NAME=$(echo "$IMAGE_NAME" | xargs)

    CURRENT=$((EXPORTED + FAILED + SKIPPED + 1))
    echo ""
    log_info "[$CURRENT/$TOTAL_IMAGES] Processing: $IMAGE_NAME"

    TAR_FILE="$IMAGES_DIR/${IMAGE_NAME}.tar"

    # Skip if already exported
    if [[ -f "$TAR_FILE" ]]; then
        log_warn "  Already exists, skipping: $TAR_FILE"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    # Build and export the image
    # First, build the image to get the JSON path
    log_info "  Building image..."
    if ! IMAGE_PATH=$(nix build ".#${IMAGE_NAME}" --print-out-paths 2>/dev/null); then
        log_error "  Failed to build image: $IMAGE_NAME"
        FAILED=$((FAILED + 1))
        FAILED_IMAGES+=("$IMAGE_NAME")
        continue
    fi

    # Export to docker-archive using copyTo
    log_info "  Exporting to docker-archive..."
    if nix run ".#${IMAGE_NAME}.copyTo" -- "docker-archive:${TAR_FILE}:${IMAGE_NAME}:latest" 2>/dev/null; then
        SIZE=$(du -h "$TAR_FILE" | cut -f1)
        log_info "  Exported: $TAR_FILE ($SIZE)"
        EXPORTED=$((EXPORTED + 1))
    else
        log_error "  Failed to export image: $IMAGE_NAME"
        FAILED=$((FAILED + 1))
        FAILED_IMAGES+=("$IMAGE_NAME")
        rm -f "$TAR_FILE"  # Clean up partial file
    fi
done < "$LIST_FILE"

echo ""
log_info "========================================"
log_info "Export Summary"
log_info "========================================"
log_info "Exported: $EXPORTED"
log_info "Skipped (already exist): $SKIPPED"
log_info "Failed: $FAILED"

if [[ $FAILED -gt 0 ]]; then
    log_warn "Failed images:"
    for img in "${FAILED_IMAGES[@]}"; do
        echo "  - $img"
    done
fi

# Create manifest
log_info "Creating manifest..."
cat > "$OUTPUT_DIR/manifest.json" << EOF
{
  "version": "1.0",
  "format": "docker-archive",
  "created": "$(date -Iseconds)",
  "images": [
$(for f in "$IMAGES_DIR"/*.tar; do
    name=$(basename "$f" .tar)
    size=$(du -b "$f" | cut -f1)
    echo "    {\"name\": \"$name\", \"file\": \"images/$name.tar\", \"size\": $size},"
done | sed '$ s/,$//')
  ],
  "total_count": $EXPORTED,
  "total_size_bytes": $(du -sb "$IMAGES_DIR" | cut -f1)
}
EOF

# Create human-readable manifest
cat > "$OUTPUT_DIR/README.txt" << EOF
BigBang Images Bundle
=====================
Created: $(date)
Format: docker-archive (one .tar per image)
Total Images: $EXPORTED

Included Images:
$(ls "$IMAGES_DIR"/*.tar 2>/dev/null | xargs -I {} basename {} .tar | sed 's/^/  - /')

Total Size: $(du -sh "$IMAGES_DIR" | cut -f1)

Usage:
------
1. Extract the bundle:
   tar -xzf ${BUNDLE_NAME}.tar.gz

2. Load images into Docker:
   for f in images/*.tar; do
       echo "Loading \$(basename \$f)..."
       docker load < "\$f"
   done

3. Or load a specific image:
   docker load < images/alertmanager.tar

4. Push to a registry:
   docker tag alertmanager:latest myregistry.com/alertmanager:latest
   docker push myregistry.com/alertmanager:latest
EOF

# Create the final bundle tarball
log_info "Creating final bundle tarball..."
cd "$OUTPUT_DIR"
tar -czvf "${BUNDLE_NAME}.tar.gz" images manifest.json README.txt

FINAL_SIZE=$(du -h "${BUNDLE_NAME}.tar.gz" | cut -f1)
log_info "========================================"
log_info "Bundle created: $OUTPUT_DIR/${BUNDLE_NAME}.tar.gz"
log_info "Bundle size: $FINAL_SIZE"
log_info "========================================"

echo ""
echo "To use this bundle:"
echo "  1. Copy ${BUNDLE_NAME}.tar.gz to target system"
echo "  2. tar -xzf ${BUNDLE_NAME}.tar.gz"
echo "  3. for f in images/*.tar; do docker load < \"\$f\"; done"
