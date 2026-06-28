#!/usr/bin/env bash
# Test piraeus-charts/snapshot-controller with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="snapshot-controller"
RELEASE="snapshot-controller"

echo "Testing snapshot-controller deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add piraeus-charts https://piraeus.io/helm-charts/ 2>/dev/null || true
helm repo update piraeus-charts >/dev/null

helm_install "$RELEASE" piraeus-charts/snapshot-controller "$NAMESPACE" \
    --set image.repository=nix-containers/snapshot-controller \
    --set image.tag=test \
    --set webhook.image.repository=nix-containers/snapshot-validation-webhook \
    --set webhook.image.tag=test

wait_for_deployment "$NAMESPACE" "snapshot-controller"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "snapshot-controller test passed!"
