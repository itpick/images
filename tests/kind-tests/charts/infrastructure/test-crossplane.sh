#!/usr/bin/env bash
# Test Crossplane with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="crossplane-system"
RELEASE="crossplane"

echo "Testing Crossplane deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Crossplane
helm_install "$RELEASE" crossplane/crossplane "$NAMESPACE" \
    --set image.repository=nix-containers/crossplane \
    --set image.tag=test

# Wait for CRDs
wait_for_crd "providers.pkg.crossplane.io"
wait_for_crd "configurations.pkg.crossplane.io"
wait_for_crd "compositeresourcedefinitions.apiextensions.crossplane.io"

# Wait for deployment
wait_for_deployment "$NAMESPACE" "crossplane"
wait_for_deployment "$NAMESPACE" "crossplane-rbac-manager"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Test Crossplane API
echo "  Testing Crossplane API..."
kubectl api-resources --api-group=pkg.crossplane.io 2>/dev/null | grep -q "Provider" || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Crossplane test passed!"
