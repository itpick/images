#!/usr/bin/env bash
# Load a nix-built image into Kind cluster via SSH remote builder
# This script handles the Remote Build -> Docker -> Kind pipeline
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
IMAGE_NAME="${2:-}"
ARCH="${3:-amd64}"  # amd64 or arm64

if [ -z "$IMAGE_NAME" ]; then
    echo "Usage: $0 <cluster-name> <image-name> [arch]"
    echo "Example: $0 nix-containers-test prometheus amd64"
    echo "Arch can be: amd64 (default) or arm64"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Navigate up from tests/kind-tests/scripts to images/
IMAGES_DIR="$(dirname "$(dirname "$(dirname "$SCRIPT_DIR")")")"

# SSH remote builder configuration
REMOTE_HOST="lucaspick@192.168.72.110"
REMOTE_DIR="~/Downloads/nix-containers"
SSH_CMD="/usr/bin/ssh"

# Map arch to nix system
case "$ARCH" in
    amd64|x86_64)
        NIX_SYSTEM="x86_64-linux"
        ;;
    arm64|aarch64)
        NIX_SYSTEM="aarch64-linux"
        ;;
    *)
        echo "ERROR: Unknown architecture: $ARCH"
        echo "Supported: amd64, arm64"
        exit 1
        ;;
esac

echo "Loading nix image '$IMAGE_NAME' ($ARCH) into Kind cluster '$CLUSTER_NAME'..."

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "ERROR: Kind cluster '$CLUSTER_NAME' not found"
    echo "Run './scripts/setup-cluster.sh $CLUSTER_NAME' first"
    exit 1
fi

# Sync local changes to remote
echo "  Syncing to remote builder..."
rsync -avz --delete --exclude='.git' --exclude='result' --exclude='result-*' \
    "$IMAGES_DIR/" "$REMOTE_HOST:$REMOTE_DIR/images/" 2>/dev/null

# Add files to git on remote (required for flakes)
$SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && git add -A 2>/dev/null || true" 2>/dev/null

# Build the image on remote
echo "  Building image on remote ($NIX_SYSTEM)..."
BUILD_OUTPUT=$($SSH_CMD "$REMOTE_HOST" "cd $REMOTE_DIR/images && nix build .#packages.$NIX_SYSTEM.$IMAGE_NAME --no-link --print-out-paths 2>&1") || {
    echo "ERROR: Failed to build image on remote"
    echo "$BUILD_OUTPUT"
    exit 1
}

IMAGE_PATH=$(echo "$BUILD_OUTPUT" | tail -1)
echo "  Built: $IMAGE_PATH"

# The nix2container output is a JSON file, use skopeo-nix2container to create tarball
echo "  Creating OCI tarball on remote..."
TARBALL_PATH="/tmp/nix-image-$IMAGE_NAME-$ARCH.tar"

$SSH_CMD "$REMOTE_HOST" "
    rm -f $TARBALL_PATH
    nix run github:nlewo/nix2container#skopeo-nix2container -- \
        copy nix:$IMAGE_PATH docker-archive:$TARBALL_PATH
" || {
    echo "ERROR: Failed to create OCI tarball on remote"
    exit 1
}

# Copy tarball from remote to local
echo "  Copying tarball from remote..."
scp "$REMOTE_HOST:$TARBALL_PATH" "/tmp/nix-image-$IMAGE_NAME-$ARCH.tar"

# Load into Docker
echo "  Loading into Docker..."
LOAD_OUTPUT=$(docker load < "/tmp/nix-image-$IMAGE_NAME-$ARCH.tar" 2>&1)
echo "  $LOAD_OUTPUT"

# Extract image reference - handle both "Loaded image: name:tag" and "Loaded image ID: sha256:..."
LOADED_IMAGE=$(echo "$LOAD_OUTPUT" | sed -n 's/^Loaded image: //p' || echo "")
LOADED_IMAGE_ID=$(echo "$LOAD_OUTPUT" | sed -n 's/^Loaded image ID: //p' || echo "")

# Tag for testing
if [ -n "$LOADED_IMAGE" ]; then
    docker tag "$LOADED_IMAGE" "nix-containers/$IMAGE_NAME:test" 2>/dev/null || true
elif [ -n "$LOADED_IMAGE_ID" ]; then
    docker tag "$LOADED_IMAGE_ID" "nix-containers/$IMAGE_NAME:test" 2>/dev/null || true
else
    echo "  WARNING: Could not determine loaded image, trying image ID from tarball..."
    # Try to get image ID from the tarball manifest
    IMAGE_ID=$(tar -xOf "/tmp/nix-image-$IMAGE_NAME-$ARCH.tar" manifest.json 2>/dev/null | jq -r '.[0].Config' | sed 's/.json$//' || echo "")
    if [ -n "$IMAGE_ID" ]; then
        docker tag "$IMAGE_ID" "nix-containers/$IMAGE_NAME:test" 2>/dev/null || true
    fi
fi

# Verify the tag exists
if ! docker image inspect "nix-containers/$IMAGE_NAME:test" &>/dev/null; then
    echo "ERROR: Failed to tag image as nix-containers/$IMAGE_NAME:test"
    exit 1
fi

# Load into Kind
echo "  Loading into Kind cluster..."
kind load docker-image "nix-containers/$IMAGE_NAME:test" --name "$CLUSTER_NAME"

# Cleanup
rm -f "/tmp/nix-image-$IMAGE_NAME-$ARCH.tar"
$SSH_CMD "$REMOTE_HOST" "rm -f $TARBALL_PATH" 2>/dev/null || true

echo "Successfully loaded nix-containers/$IMAGE_NAME:test into Kind cluster $CLUSTER_NAME"
