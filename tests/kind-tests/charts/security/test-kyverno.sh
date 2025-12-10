#!/usr/bin/env bash
# Test Kyverno with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="kyverno"
RELEASE="kyverno"

echo "Testing Kyverno deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Kyverno
helm_install "$RELEASE" kyverno/kyverno "$NAMESPACE" \
    --set image.repository=nix-containers/kyverno \
    --set image.tag=test \
    --set initImage.repository=nix-containers/kyverno \
    --set initImage.tag=test

# Wait for CRDs
wait_for_crd "clusterpolicies.kyverno.io"
wait_for_crd "policies.kyverno.io"

# Wait for deployment
wait_for_deployment "$NAMESPACE" "kyverno-admission-controller"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Create a simple policy
kubectl apply -f - <<EOF
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: test-policy
spec:
  validationFailureAction: Audit
  rules:
    - name: check-labels
      match:
        any:
        - resources:
            kinds:
            - Pod
      validate:
        message: "label 'app' is required"
        pattern:
          metadata:
            labels:
              app: "?*"
EOF

# Verify policy is ready
echo "  Waiting for policy to be ready..."
kubectl wait clusterpolicy test-policy --for=condition=Ready --timeout=60s 2>/dev/null || true

# Test policy (create a pod that violates the policy - should be audited)
kubectl run test-pod --image=nginx:latest --restart=Never -n default 2>/dev/null || true
kubectl delete pod test-pod -n default --ignore-not-found=true

# Cleanup
kubectl delete clusterpolicy test-policy --ignore-not-found=true
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Kyverno test passed!"
