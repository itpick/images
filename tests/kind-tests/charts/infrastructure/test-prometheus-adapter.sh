#!/usr/bin/env bash
# Test prometheus-community/prometheus-adapter with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="prometheus-adapter"
RELEASE="prometheus-adapter"

echo "Testing prometheus-adapter deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 2>/dev/null || true
helm repo update prometheus-community >/dev/null

helm_install "$RELEASE" prometheus-community/prometheus-adapter "$NAMESPACE" \
    --set image.repository=nix-containers/prometheus-adapter \
    --set image.tag=test \
    --set prometheus.url=http://prometheus.example \
    --set prometheus.port=9090

wait_for_deployment "$NAMESPACE" "prometheus-adapter"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "prometheus-adapter test passed!"
