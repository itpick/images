#!/usr/bin/env bash
# Test cert-manager with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="cert-manager"
RELEASE="cert-manager"

echo "Testing cert-manager deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install cert-manager with CRDs
helm_install "$RELEASE" jetstack/cert-manager "$NAMESPACE" \
    --set installCRDs=true \
    --set image.repository=nix-containers/cert-manager-controller \
    --set image.tag=test \
    --set webhook.image.repository=nix-containers/cert-manager-webhook \
    --set webhook.image.tag=test \
    --set cainjector.image.repository=nix-containers/cert-manager-cainjector \
    --set cainjector.image.tag=test \
    --set startupapicheck.image.repository=nix-containers/cert-manager-startupapicheck \
    --set startupapicheck.image.tag=test

# Wait for CRDs
wait_for_crd "certificates.cert-manager.io"
wait_for_crd "clusterissuers.cert-manager.io"

# Wait for deployments
wait_for_deployment "$NAMESPACE" "cert-manager"
wait_for_deployment "$NAMESPACE" "cert-manager-webhook"
wait_for_deployment "$NAMESPACE" "cert-manager-cainjector"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Create a self-signed issuer to test
kubectl apply -f - <<EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: test-selfsigned
spec:
  selfSigned: {}
EOF

# Create a test certificate
kubectl apply -f - <<EOF
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: test-cert
  namespace: default
spec:
  secretName: test-cert-tls
  duration: 24h
  renewBefore: 12h
  commonName: test.example.com
  issuerRef:
    name: test-selfsigned
    kind: ClusterIssuer
EOF

# Wait for certificate to be ready
echo "  Waiting for test certificate..."
kubectl wait certificate test-cert -n default --for=condition=Ready --timeout=60s

# Cleanup test resources
kubectl delete certificate test-cert -n default --ignore-not-found=true
kubectl delete clusterissuer test-selfsigned --ignore-not-found=true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "cert-manager test passed!"
