#!/usr/bin/env bash
# Test KEDA with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="keda"
RELEASE="keda"

echo "Testing KEDA deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install KEDA
helm_install "$RELEASE" keda/keda "$NAMESPACE" \
    --set image.keda.repository=nix-containers/keda \
    --set image.keda.tag=test \
    --set image.metricsApiServer.repository=nix-containers/keda-metrics-apiserver \
    --set image.metricsApiServer.tag=test

# Wait for CRDs
wait_for_crd "scaledobjects.keda.sh"
wait_for_crd "scaledjobs.keda.sh"
wait_for_crd "triggerauthentications.keda.sh"

# Wait for deployments
wait_for_deployment "$NAMESPACE" "keda-operator"
wait_for_deployment "$NAMESPACE" "keda-operator-metrics-apiserver"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Create a test ScaledObject
kubectl apply -f - <<EOF
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: test-scaledobject
  namespace: default
spec:
  scaleTargetRef:
    name: test-deployment
  minReplicaCount: 0
  maxReplicaCount: 10
  triggers:
    - type: cron
      metadata:
        timezone: UTC
        start: "0 0 * * *"
        end: "0 0 * * *"
        desiredReplicas: "1"
EOF

# Verify ScaledObject
echo "  Checking ScaledObject status..."
kubectl get scaledobject test-scaledobject -n default -o jsonpath='{.status.conditions[0].status}' 2>/dev/null || true

# Cleanup
kubectl delete scaledobject test-scaledobject -n default --ignore-not-found=true
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "KEDA test passed!"
