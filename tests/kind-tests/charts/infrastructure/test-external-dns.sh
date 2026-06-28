#!/usr/bin/env bash
# Test external-dns/external-dns with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="external-dns"
RELEASE="external-dns"

echo "Testing external-dns deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/ 2>/dev/null || true
helm repo update external-dns >/dev/null

helm_install "$RELEASE" external-dns/external-dns "$NAMESPACE" \
    --set image.repository=nix-containers/external-dns \
    --set image.tag=test \
    --set provider=inmemory \
    --set policy=upsert-only

wait_for_deployment "$NAMESPACE" "external-dns"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "external-dns test passed!"
