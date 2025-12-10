#!/usr/bin/env bash
# Teardown Kind cluster
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"

echo "=== Tearing down Kind cluster: $CLUSTER_NAME ==="

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "Cluster $CLUSTER_NAME does not exist"
    exit 0
fi

# Delete cluster
kind delete cluster --name "$CLUSTER_NAME"

# Remove kubeconfig
KUBECONFIG="${HOME}/.kube/kind-${CLUSTER_NAME}"
if [ -f "$KUBECONFIG" ]; then
    rm -f "$KUBECONFIG"
    echo "Removed kubeconfig: $KUBECONFIG"
fi

echo "=== Cluster $CLUSTER_NAME deleted ==="
