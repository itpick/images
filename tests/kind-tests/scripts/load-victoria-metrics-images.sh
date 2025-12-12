#!/usr/bin/env bash
# Load all VictoriaMetrics nix-built images into Kind cluster
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Loading VictoriaMetrics images into Kind cluster: $CLUSTER_NAME ==="

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

# Load each image
for image in "${VM_IMAGES[@]}"; do
    echo ""
    echo "--- Loading $image ---"
    "$SCRIPT_DIR/nix-load-image.sh" "$CLUSTER_NAME" "$image" || {
        echo "WARNING: Failed to load $image, continuing..."
    }
done

echo ""
echo "=== VictoriaMetrics images loaded ==="
echo ""
echo "Verify with: docker exec ${CLUSTER_NAME}-control-plane crictl images | grep victoria"
echo ""

# Show loaded images
docker exec "${CLUSTER_NAME}-control-plane" crictl images 2>/dev/null | grep -i "victoria\|nix-containers" || true
