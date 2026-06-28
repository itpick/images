#!/usr/bin/env bash
# Test cnpg/cloudnative-pg operator with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="cnpg-system"
RELEASE="cnpg"

echo "Testing CloudNative-PG operator deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add cnpg https://cloudnative-pg.github.io/charts 2>/dev/null || true
helm repo update cnpg >/dev/null

helm_install "$RELEASE" cnpg/cloudnative-pg "$NAMESPACE" \
    --set image.repository=nix-containers/cloudnative-pg \
    --set image.tag=test

wait_for_deployment "$NAMESPACE" "cnpg-cloudnative-pg"
wait_for_crd "clusters.postgresql.cnpg.io"

check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "cloudnative-pg test passed!"
