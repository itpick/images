#!/usr/bin/env bash
# Test dragonfly-operator with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="dragonfly-operator"
RELEASE="dragonfly-operator"

echo "Testing Dragonfly Operator deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

# Dragonfly publishes a Helm chart via OCI on ghcr.io.
helm_install "$RELEASE" \
    oci://ghcr.io/dragonflydb/dragonfly-operator/helm/dragonfly-operator \
    "$NAMESPACE" \
    --set manager.image.repository=nix-containers/dragonfly-operator \
    --set manager.image.tag=test \
    --set kubeRbacProxy.image.repository=nix-containers/kube-rbac-proxy \
    --set kubeRbacProxy.image.tag=test

wait_for_deployment "$NAMESPACE" "dragonfly-operator"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "Dragonfly Operator test passed!"
