#!/usr/bin/env bash
# Load all VictoriaMetrics nix-built images into Kind cluster via SSH builder
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
ARCH="${2:-amd64}"  # amd64 or arm64
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Loading VictoriaMetrics images into Kind cluster: $CLUSTER_NAME (arch: $ARCH) ==="

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "ERROR: Kind cluster '$CLUSTER_NAME' not found"
    echo "Run './scripts/setup-cluster.sh $CLUSTER_NAME' first"
    exit 1
fi

# List of VictoriaMetrics images to load
VM_IMAGES=(
    "victoria-metrics"
    "victoriametrics-vmagent"
    "victoriametrics-vmalert"
    "victoriametrics-vmauth"
    "victoriametrics-vminsert"
    "victoriametrics-vmselect"
    "victoriametrics-vmstorage"
    "victoriametrics-operator"
)

FAILED=()
SUCCEEDED=()

# Load each image
for image in "${VM_IMAGES[@]}"; do
    echo ""
    echo "--- Loading $image ($ARCH) ---"
    if "$SCRIPT_DIR/nix-load-image.sh" "$CLUSTER_NAME" "$image" "$ARCH"; then
        SUCCEEDED+=("$image")
        echo "✓ $image loaded successfully"
    else
        FAILED+=("$image")
        echo "✗ $image failed to load"
    fi
done

echo ""
echo "=== VictoriaMetrics Images Load Summary ==="
echo "Succeeded: ${#SUCCEEDED[@]}"
echo "Failed: ${#FAILED[@]}"

if [ ${#FAILED[@]} -gt 0 ]; then
    echo ""
    echo "Failed images:"
    for img in "${FAILED[@]}"; do
        echo "  - $img"
    done
fi

echo ""
echo "Verify with: docker exec ${CLUSTER_NAME}-control-plane crictl images | grep victoria"
echo ""

# Show loaded images
docker exec "${CLUSTER_NAME}-control-plane" crictl images 2>/dev/null | grep -i "victoria\|nix-containers" || true
