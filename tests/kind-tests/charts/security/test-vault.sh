#!/usr/bin/env bash
# Test Vault with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="vault"
RELEASE="vault"

echo "Testing Vault deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Vault in dev mode (for testing)
helm_install "$RELEASE" hashicorp/vault "$NAMESPACE" \
    --set server.image.repository=nix-containers/vault \
    --set server.image.tag=test \
    --set server.dev.enabled=true \
    --set server.dev.devRootToken=root \
    --set injector.enabled=false

# Wait for deployment
wait_for_pod "$NAMESPACE" "app.kubernetes.io/name=vault"

# Test Vault status
echo "  Testing Vault status..."
kubectl exec -n "$NAMESPACE" vault-0 -- vault status 2>/dev/null | grep -q "Sealed.*false"

# Test Vault operations
echo "  Testing Vault operations..."
kubectl exec -n "$NAMESPACE" vault-0 -- sh -c "
    export VAULT_TOKEN=root
    vault secrets list
    vault kv put secret/test foo=bar
    vault kv get secret/test | grep -q bar
" 2>/dev/null

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Vault test passed!"
