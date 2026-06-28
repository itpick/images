#!/usr/bin/env bash
# Test emberstack/reflector with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="reflector"
RELEASE="reflector"

echo "Testing Reflector deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add emberstack https://emberstack.github.io/helm-charts 2>/dev/null || true
helm repo update emberstack >/dev/null

helm_install "$RELEASE" emberstack/reflector "$NAMESPACE" \
    --set image.repository=nix-containers/reflector \
    --set image.tag=test

wait_for_deployment "$NAMESPACE" "reflector"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "Reflector test passed!"
