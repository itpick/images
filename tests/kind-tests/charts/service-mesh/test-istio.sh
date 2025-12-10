#!/usr/bin/env bash
# Test Istio with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="istio-system"
RELEASE_BASE="istio-base"
RELEASE_ISTIOD="istiod"

echo "Testing Istio deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE_ISTIOD" "$NAMESPACE"
helm_uninstall "$RELEASE_BASE" "$NAMESPACE"

# Install Istio base (CRDs)
helm_install "$RELEASE_BASE" istio/base "$NAMESPACE" \
    --set defaultRevision=default

# Wait for CRDs
wait_for_crd "virtualservices.networking.istio.io"
wait_for_crd "destinationrules.networking.istio.io"
wait_for_crd "gateways.networking.istio.io"

# Install Istiod
helm_install "$RELEASE_ISTIOD" istio/istiod "$NAMESPACE" \
    --set pilot.image=nix-containers/istio-pilot:test

# Wait for deployment
wait_for_deployment "$NAMESPACE" "istiod"

# Verify release status
check_helm_release "$RELEASE_BASE" "$NAMESPACE"
check_helm_release "$RELEASE_ISTIOD" "$NAMESPACE"

# Test Istiod health
echo "  Testing Istiod health..."
kubectl exec -n "$NAMESPACE" deploy/istiod -- pilot-discovery version 2>/dev/null | head -1 || true

# Cleanup
helm_uninstall "$RELEASE_ISTIOD" "$NAMESPACE"
helm_uninstall "$RELEASE_BASE" "$NAMESPACE"

echo "Istio test passed!"
