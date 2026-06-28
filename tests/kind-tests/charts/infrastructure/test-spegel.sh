#!/usr/bin/env bash
# Test spegel-org/spegel with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="spegel"
RELEASE="spegel"

echo "Testing Spegel deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm_install "$RELEASE" \
    oci://ghcr.io/spegel-org/helm-charts/spegel \
    "$NAMESPACE" \
    --set image.repository=nix-containers/spegel \
    --set image.tag=test

# Spegel is a DaemonSet, not a Deployment.
echo "  Waiting for spegel daemonset..."
kubectl rollout status daemonset/spegel -n "$NAMESPACE" --timeout=300s 2>/dev/null

check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "Spegel test passed!"
