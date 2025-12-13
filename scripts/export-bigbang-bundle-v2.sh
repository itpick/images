#!/usr/bin/env bash
# export-bigbang-bundle-v2.sh
# Export BigBang images to a portable docker-archive bundle
# Uses skopeo from nix2container for nix: transport support
#
# Usage:
#   ./scripts/export-bigbang-bundle-v2.sh [output-dir] [list-file]
#
# This script must be run from the nix-containers/images directory (where flake.nix is)
# It requires a working nix installation with flakes enabled

set -euo pipefail

OUTPUT_DIR="${1:-/tmp/bigbang-bundle-export}"
LIST_FILE="${2:-bigbang.txt}"
BUNDLE_NAME="bigbang-bundle"

# Colors for output
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
    log_error "List file not found: $LIST_FILE"
    exit 1
fi

# Get skopeo from nix2container (has nix: transport support)
log_info "Getting skopeo with nix: transport support..."
SKOPEO_PATH=$(nix build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>/dev/null | head -1)
if [[ -z "$SKOPEO_PATH" ]] || [[ ! -x "$SKOPEO_PATH/bin/skopeo" ]]; then
    log_error "Failed to get skopeo from nix2container"
    exit 1
fi
SKOPEO="$SKOPEO_PATH/bin/skopeo"
log_info "Using skopeo: $SKOPEO"

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
TOTAL_SIZE=0

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
        SIZE=$(du -h "$TAR_FILE" | cut -f1)
        log_warn "  Already exists ($SIZE), skipping"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi

    # Build the image to get the JSON path
    log_info "  Building image..."
    IMAGE_JSON=$(nix build ".#${IMAGE_NAME}" --no-link --print-out-paths 2>/dev/null)
    if [[ -z "$IMAGE_JSON" ]] || [[ ! -f "$IMAGE_JSON" ]]; then
        log_error "  Failed to build image: $IMAGE_NAME"
        FAILED=$((FAILED + 1))
        FAILED_IMAGES+=("$IMAGE_NAME")
        continue
    fi
    log_info "  Built: $IMAGE_JSON"

    # Export to docker-archive using skopeo
    log_info "  Exporting to docker-archive..."
    if $SKOPEO copy --insecure-policy "nix:$IMAGE_JSON" "docker-archive:${TAR_FILE}:${IMAGE_NAME}:latest" 2>&1; then
        SIZE=$(du -h "$TAR_FILE" | cut -f1)
        SIZE_BYTES=$(du -b "$TAR_FILE" | cut -f1)
        TOTAL_SIZE=$((TOTAL_SIZE + SIZE_BYTES))
        log_info "  Exported: $SIZE"
        EXPORTED=$((EXPORTED + 1))
    else
        log_error "  Failed to export image: $IMAGE_NAME"
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
  "platform": "$(uname -m)",
  "images": [
$(for f in "$IMAGES_DIR"/*.tar; do
    if [[ -f "$f" ]]; then
        name=$(basename "$f" .tar)
        size=$(du -b "$f" 2>/dev/null | cut -f1 || echo 0)
        echo "    {\"name\": \"$name\", \"file\": \"images/$name.tar\", \"size\": $size},"
    fi
done | sed '$ s/,$//')
  ],
  "total_count": $EXPORTED,
  "total_size_bytes": $TOTAL_SIZE
}
EOF

# Human-readable size
TOTAL_SIZE_HR=$(numfmt --to=iec $TOTAL_SIZE 2>/dev/null || echo "${TOTAL_SIZE} bytes")

# Create README
cat > "$OUTPUT_DIR/README.txt" << EOF
BigBang Images Bundle
=====================
Created: $(date)
Platform: $(uname -m)
Format: docker-archive (one .tar per image)
Total Images: $EXPORTED
Total Size: $TOTAL_SIZE_HR

Included Images:
$(ls "$IMAGES_DIR"/*.tar 2>/dev/null | xargs -I {} basename {} .tar | sed 's/^/  - /' || echo "  (none)")

Usage:
------
1. Extract the bundle (if compressed):
   tar -xzf ${BUNDLE_NAME}.tar.gz

2. Load all images into Docker:
   for f in images/*.tar; do
       echo "Loading \$(basename \$f .tar)..."
       docker load < "\$f"
   done

3. Or load a specific image:
   docker load < images/alertmanager.tar

4. Push to a registry:
   docker tag alertmanager:latest myregistry.com/alertmanager:latest
   docker push myregistry.com/alertmanager:latest

5. Or use skopeo to push directly from tarball:
   skopeo copy docker-archive:images/alertmanager.tar docker://myregistry.com/alertmanager:latest
EOF

# Create the final bundle tarball
log_info "Creating final bundle tarball..."
BUNDLE_FILE="${OUTPUT_DIR}/${BUNDLE_NAME}.tar.gz"
tar -czvf "$BUNDLE_FILE" -C "$OUTPUT_DIR" images manifest.json README.txt

FINAL_SIZE=$(du -h "$BUNDLE_FILE" | cut -f1)
log_info "========================================"
log_info "Bundle created: $BUNDLE_FILE"
log_info "Bundle size: $FINAL_SIZE"
log_info "========================================"

echo ""
echo "To use this bundle on another system:"
echo "  1. Copy $BUNDLE_FILE to target system"
echo "  2. tar -xzf ${BUNDLE_NAME}.tar.gz"
echo "  3. for f in images/*.tar; do docker load < \"\$f\"; done"
