#!/usr/bin/env bash
# Test kube-prometheus-stack with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="monitoring"
RELEASE="prometheus"

echo "Testing kube-prometheus-stack deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install kube-prometheus-stack (minimal for testing)
helm_install "$RELEASE" prometheus-community/kube-prometheus-stack "$NAMESPACE" \
    --set prometheus.prometheusSpec.image.repository=nix-containers/prometheus \
    --set prometheus.prometheusSpec.image.tag=test \
    --set alertmanager.alertmanagerSpec.image.repository=nix-containers/alertmanager \
    --set alertmanager.alertmanagerSpec.image.tag=test \
    --set grafana.image.repository=nix-containers/grafana \
    --set grafana.image.tag=test \
    --set grafana.enabled=true \
    --set prometheus.enabled=true \
    --set alertmanager.enabled=true \
    --set kubeStateMetrics.enabled=false \
    --set nodeExporter.enabled=false \
    --set prometheusOperator.enabled=true

# Wait for CRDs
wait_for_crd "prometheuses.monitoring.coreos.com"
wait_for_crd "alertmanagers.monitoring.coreos.com"
wait_for_crd "servicemonitors.monitoring.coreos.com"

# Wait for deployments
wait_for_deployment "$NAMESPACE" "prometheus-grafana"
wait_for_deployment "$NAMESPACE" "prometheus-kube-prometheus-operator"

# Wait for StatefulSets
echo "  Waiting for Prometheus StatefulSet..."
kubectl rollout status statefulset/prometheus-prometheus-kube-prometheus-prometheus -n "$NAMESPACE" --timeout=300s 2>/dev/null || true

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Test Prometheus API
echo "  Testing Prometheus API..."
kubectl port-forward -n "$NAMESPACE" svc/prometheus-kube-prometheus-prometheus 9090:9090 &
PORT_FORWARD_PID=$!
sleep 5
curl -s http://localhost:9090/-/healthy 2>/dev/null | grep -q "Prometheus Server is Healthy" || true
kill $PORT_FORWARD_PID 2>/dev/null || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "kube-prometheus-stack test passed!"
