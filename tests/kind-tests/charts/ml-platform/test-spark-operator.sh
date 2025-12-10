#!/usr/bin/env bash
# Test Spark Operator with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="spark-operator"
RELEASE="spark-operator"

echo "Testing Spark Operator deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Spark Operator
helm_install "$RELEASE" spark-operator/spark-operator "$NAMESPACE" \
    --set image.repository=nix-containers/spark-operator \
    --set image.tag=test \
    --set webhook.enable=true

# Wait for CRDs
wait_for_crd "sparkapplications.sparkoperator.k8s.io"
wait_for_crd "scheduledsparkapplications.sparkoperator.k8s.io"

# Wait for deployment
wait_for_deployment "$NAMESPACE" "spark-operator"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Create a test SparkApplication (dry-run only, as it needs actual Spark)
echo "  Verifying SparkApplication CRD..."
kubectl explain sparkapplication.spec 2>/dev/null | head -5 || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Spark Operator test passed!"
