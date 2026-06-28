#!/usr/bin/env bash
# Test grafana/alloy with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="alloy"
RELEASE="alloy"

echo "Testing Alloy deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add grafana https://grafana.github.io/helm-charts 2>/dev/null || true
helm repo update grafana >/dev/null

helm_install "$RELEASE" grafana/alloy "$NAMESPACE" \
    --set alloy.image.registry=nix-containers \
    --set alloy.image.repository=alloy \
    --set alloy.image.tag=test \
    --set configReloader.image.registry=nix-containers \
    --set configReloader.image.repository=configmap-reload \
    --set configReloader.image.tag=test

wait_for_pod "$NAMESPACE" "app.kubernetes.io/name=alloy"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "Alloy test passed!"
