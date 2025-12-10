#!/usr/bin/env bash
# Test External Secrets Operator with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="external-secrets"
RELEASE="external-secrets"

echo "Testing External Secrets Operator deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install External Secrets Operator
helm_install "$RELEASE" external-secrets/external-secrets "$NAMESPACE" \
    --set image.repository=nix-containers/external-secrets \
    --set image.tag=test \
    --set webhook.image.repository=nix-containers/external-secrets \
    --set webhook.image.tag=test \
    --set certController.image.repository=nix-containers/external-secrets \
    --set certController.image.tag=test

# Wait for CRDs
wait_for_crd "externalsecrets.external-secrets.io"
wait_for_crd "secretstores.external-secrets.io"

# Wait for deployment
wait_for_deployment "$NAMESPACE" "external-secrets"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Create a fake secret store (kubernetes backend)
kubectl apply -f - <<EOF
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: test-store
  namespace: default
spec:
  provider:
    kubernetes:
      remoteNamespace: default
      server:
        caProvider:
          type: ConfigMap
          name: kube-root-ca.crt
          key: ca.crt
      auth:
        serviceAccount:
          name: default
EOF

# Verify secret store
echo "  Checking SecretStore status..."
kubectl get secretstore test-store -n default -o jsonpath='{.status.conditions[0].type}' 2>/dev/null || true

# Cleanup
kubectl delete secretstore test-store -n default --ignore-not-found=true
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "External Secrets test passed!"
