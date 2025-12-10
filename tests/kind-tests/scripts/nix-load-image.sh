#!/usr/bin/env bash
# Load a nix-built image into Kind cluster via Lima
# This script handles the Lima -> Docker -> Kind pipeline
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
IMAGE_NAME="${2:-}"

if [ -z "$IMAGE_NAME" ]; then
    echo "Usage: $0 <cluster-name> <image-name>"
    echo "Example: $0 nix-containers-test prometheus"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGES_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")/images"

echo "Loading nix image '$IMAGE_NAME' into Kind cluster '$CLUSTER_NAME'..."

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "ERROR: Kind cluster '$CLUSTER_NAME' not found"
    echo "Run 'make cluster-up' first"
    exit 1
fi

# Build the image in Lima
echo "  Building image via Lima..."
limactl shell default -- bash -c "
    cd /tmp
    nix --extra-experimental-features 'nix-command flakes' build '$IMAGES_DIR#$IMAGE_NAME' -o /tmp/nix-image

    # Export image to tar
    if [ -f /tmp/nix-image ]; then
        # nix2container images are scripts that output to stdout
        /tmp/nix-image > /tmp/nix-image.tar
        echo 'Image built successfully'
    else
        echo 'Failed to build image'
        exit 1
    fi
"

# Copy the tar from Lima to host
echo "  Copying image from Lima..."
limactl copy default:/tmp/nix-image.tar /tmp/nix-image-$IMAGE_NAME.tar

# Load into Docker
echo "  Loading into Docker..."
LOADED_IMAGE=$(docker load < /tmp/nix-image-$IMAGE_NAME.tar 2>&1 | grep "Loaded image" | sed 's/Loaded image: //')
echo "  Loaded: $LOADED_IMAGE"

# Tag for testing
docker tag "$LOADED_IMAGE" "nix-containers/$IMAGE_NAME:test" 2>/dev/null || true

# Load into Kind
echo "  Loading into Kind cluster..."
kind load docker-image "nix-containers/$IMAGE_NAME:test" --name "$CLUSTER_NAME"

# Cleanup
rm -f /tmp/nix-image-$IMAGE_NAME.tar
limactl shell default -- rm -f /tmp/nix-image /tmp/nix-image.tar

echo "Successfully loaded nix-containers/$IMAGE_NAME:test into Kind cluster $CLUSTER_NAME"
