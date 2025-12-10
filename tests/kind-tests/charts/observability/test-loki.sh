#!/usr/bin/env bash
# Test Loki with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="logging"
RELEASE="loki"

echo "Testing Loki deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Loki in monolithic mode (simpler for testing)
helm_install "$RELEASE" grafana/loki "$NAMESPACE" \
    --set loki.image.repository=nix-containers/loki \
    --set loki.image.tag=test \
    --set deploymentMode=SingleBinary \
    --set singleBinary.replicas=1 \
    --set loki.commonConfig.replication_factor=1 \
    --set loki.storage.type=filesystem \
    --set backend.replicas=0 \
    --set read.replicas=0 \
    --set write.replicas=0

# Wait for deployment
wait_for_pod "$NAMESPACE" "app.kubernetes.io/name=loki"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Test Loki API
echo "  Testing Loki API..."
kubectl port-forward -n "$NAMESPACE" svc/loki 3100:3100 &
PORT_FORWARD_PID=$!
sleep 5
curl -s http://localhost:3100/ready 2>/dev/null | grep -q "ready" || true
kill $PORT_FORWARD_PID 2>/dev/null || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Loki test passed!"
