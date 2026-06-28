#!/usr/bin/env bash
# Test stakater/reloader with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="reloader"
RELEASE="reloader"

echo "Testing Reloader deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add stakater https://stakater.github.io/stakater-charts 2>/dev/null || true
helm repo update stakater >/dev/null

helm_install "$RELEASE" stakater/reloader "$NAMESPACE" \
    --set reloader.deployment.image.name=nix-containers/reloader \
    --set reloader.deployment.image.tag=test

wait_for_deployment "$NAMESPACE" "reloader-reloader"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "Reloader test passed!"
