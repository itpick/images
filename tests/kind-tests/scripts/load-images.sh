#!/usr/bin/env bash
# Load nix container images into Kind cluster
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
IMAGES_DIR="${2:-../images}"
SPECIFIC_IMAGE="${3:-}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Loading images into Kind cluster: $CLUSTER_NAME ==="

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "ERROR: Cluster $CLUSTER_NAME does not exist"
    echo "Run 'make cluster-up' first"
    exit 1
fi

# Resolve images directory
IMAGES_DIR="$(cd "$SCRIPT_DIR" && cd "$IMAGES_DIR" && pwd)"

if [ ! -d "$IMAGES_DIR" ]; then
    echo "ERROR: Images directory not found: $IMAGES_DIR"
    exit 1
fi

cd "$IMAGES_DIR"

# Function to load a single image
load_image() {
    local img="$1"
    echo "Loading $img..."

    # Build the image
    if ! nix build ".#$img" -o "/tmp/nix-img-$img" 2>/dev/null; then
        echo "  SKIP: Failed to build $img"
        return 1
    fi

    # Load into docker
    if [ -f "/tmp/nix-img-$img" ]; then
        # nix2container produces a script that loads the image
        /tmp/nix-img-$img | docker load 2>/dev/null

        # Get the image name from the loaded output
        local image_name
        image_name=$(docker images --format "{{.Repository}}:{{.Tag}}" | head -1)

        # Load into Kind
        kind load docker-image "$image_name" --name "$CLUSTER_NAME" 2>/dev/null || true

        echo "  OK: Loaded $img as $image_name"
        rm -f "/tmp/nix-img-$img"
        return 0
    fi

    echo "  SKIP: No image output for $img"
    return 1
}

# Get list of images to load
if [ -n "$SPECIFIC_IMAGE" ]; then
    IMAGES="$SPECIFIC_IMAGE"
else
    # Get images relevant for Helm chart testing
    IMAGES=$(cat <<EOF
cert-manager-controller
cert-manager-webhook
cert-manager-cainjector
cert-manager-acmesolver
prometheus
alertmanager
grafana
loki
tempo
vault
argocd
kyverno
external-secrets-operator
coredns
nginx
redis
postgres
EOF
)
fi

# Load images
SUCCESS=0
FAILED=0
for img in $IMAGES; do
    if load_image "$img"; then
        SUCCESS=$((SUCCESS + 1))
    else
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "=== Image loading complete ==="
echo "Loaded: $SUCCESS"
echo "Failed: $FAILED"
