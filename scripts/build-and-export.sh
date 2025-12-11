#!/usr/bin/env bash
# Build nix image and export to compressed tar.gz
# Usage: ./build-and-export.sh <image-name> [output-dir]
#
# Example: ./build-and-export.sh kyverno /tmp/docker-images
#
# This script:
# 1. Builds the nix image
# 2. Extracts the version from image labels
# 3. Exports to docker-archive format
# 4. Compresses with gzip
# 5. Renames to include version

set -euo pipefail

IMAGE_NAME="${1:?Usage: $0 <image-name> [output-dir]}"
OUTPUT_DIR="${2:-/tmp/docker-images}"
FLAKE="${FLAKE:-/Users/lucaspick/workspace/drduker/nix-containers/images}"
SKOPEO="${SKOPEO:-/tmp/skopeo-n2c/bin/skopeo}"

mkdir -p "$OUTPUT_DIR"

echo "=== Building $IMAGE_NAME ==="
cd /tmp
rm -f "result-$IMAGE_NAME" 2>/dev/null || true

nix --extra-experimental-features "nix-command flakes" build "$FLAKE#$IMAGE_NAME" -o "result-$IMAGE_NAME" 2>&1

if [ ! -f "/tmp/result-$IMAGE_NAME" ]; then
  echo "FAILED: Build did not produce result file"
  exit 1
fi

# Extract version from image config
VERSION=$(cat "/tmp/result-$IMAGE_NAME" | jq -r '.["image-config"].Labels["org.opencontainers.image.version"] // "latest"')
echo "Version: $VERSION"

# Export to docker-archive (uncompressed tar)
TEMP_TAR="$OUTPUT_DIR/${IMAGE_NAME}.tar"
FINAL_TGZ="$OUTPUT_DIR/${IMAGE_NAME}-${VERSION}.tar.gz"

echo "Exporting $IMAGE_NAME:$VERSION"
$SKOPEO copy "nix:/tmp/result-$IMAGE_NAME" "docker-archive:$TEMP_TAR:nix-containers/$IMAGE_NAME:$VERSION" 2>&1

# Compress and rename
echo "Compressing to $FINAL_TGZ"
gzip -c "$TEMP_TAR" > "$FINAL_TGZ"
rm -f "$TEMP_TAR"

# Show result
ls -lh "$FINAL_TGZ"
echo "SUCCESS: $IMAGE_NAME:$VERSION"
