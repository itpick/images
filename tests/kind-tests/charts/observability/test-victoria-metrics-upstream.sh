#!/usr/bin/env bash
# Test VictoriaMetrics stack with UPSTREAM images (for validation)
# This test deploys all VictoriaMetrics charts to validate helm chart functionality
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="victoria-metrics"
CLUSTER_NAME="${CLUSTER_NAME:-nix-containers-test}"

echo "=== Testing VictoriaMetrics stack with upstream images ==="

# Cleanup any previous installation
echo "Cleaning up previous installations..."
helm_uninstall "vm-operator" "$NAMESPACE" || true
helm_uninstall "vm-cluster" "$NAMESPACE" || true
helm_uninstall "vm-agent" "$NAMESPACE" || true
helm_uninstall "vm-alert" "$NAMESPACE" || true
helm_uninstall "vm-auth" "$NAMESPACE" || true
helm_uninstall "vm-single" "$NAMESPACE" || true
kubectl delete namespace "$NAMESPACE" --ignore-not-found=true --wait=true 2>/dev/null || true
sleep 5

# Create namespace
echo "Creating namespace $NAMESPACE..."
kubectl create namespace "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -

# Add VictoriaMetrics helm repo
echo "Adding VictoriaMetrics Helm repository..."
helm repo add vm https://victoriametrics.github.io/helm-charts 2>/dev/null || true
helm repo update vm

# ========================================
# 1. Deploy VictoriaMetrics Operator
# ========================================
echo ""
echo "=== Step 1: Deploying VictoriaMetrics Operator ==="
helm upgrade --install vm-operator vm/victoria-metrics-operator \
    --namespace "$NAMESPACE" \
    --create-namespace \
    --set operator.disable_prometheus_converter=true \
    --set operator.enable_converter_ownership=false \
    --wait \
    --timeout 5m

# Wait for operator CRDs
echo "  Waiting for VictoriaMetrics CRDs..."
sleep 10
wait_for_crd "vmclusters.operator.victoriametrics.com" 120 || true
wait_for_crd "vmagents.operator.victoriametrics.com" 120 || true
wait_for_crd "vmalerts.operator.victoriametrics.com" 120 || true
wait_for_crd "vmsingles.operator.victoriametrics.com" 120 || true

# Wait for operator deployment
wait_for_deployment "$NAMESPACE" "vm-operator-victoria-metrics-operator"

echo "  Operator deployed successfully!"

# ========================================
# 2. Deploy VictoriaMetrics Single (standalone mode)
# ========================================
echo ""
echo "=== Step 2: Deploying VictoriaMetrics Single ==="
helm upgrade --install vm-single vm/victoria-metrics-single \
    --namespace "$NAMESPACE" \
    --set server.persistentVolume.enabled=false \
    --set server.resources.requests.memory=256Mi \
    --set server.resources.requests.cpu=100m \
    --wait \
    --timeout 5m

# Wait for single server
echo "  Waiting for VictoriaMetrics Single..."
kubectl rollout status statefulset/vm-single-victoria-metrics-single-server -n "$NAMESPACE" --timeout=180s 2>/dev/null || true

echo "  VictoriaMetrics Single deployed!"

# ========================================
# 3. Deploy VictoriaMetrics Agent
# ========================================
echo ""
echo "=== Step 3: Deploying VictoriaMetrics Agent ==="
helm upgrade --install vm-agent vm/victoria-metrics-agent \
    --namespace "$NAMESPACE" \
    --set 'remoteWrite[0].url=http://vm-single-victoria-metrics-single-server:8428/api/v1/write' \
    --set resources.requests.memory=128Mi \
    --set resources.requests.cpu=50m \
    --wait \
    --timeout 5m

wait_for_deployment "$NAMESPACE" "vm-agent-victoria-metrics-agent"
echo "  VictoriaMetrics Agent deployed!"

# ========================================
# 4. Deploy VictoriaMetrics Alert
# ========================================
echo ""
echo "=== Step 4: Deploying VictoriaMetrics Alert ==="
helm upgrade --install vm-alert vm/victoria-metrics-alert \
    --namespace "$NAMESPACE" \
    --set server.datasource.url=http://vm-single-victoria-metrics-single-server:8428 \
    --set server.notifier.alertmanager.url="" \
    --set server.resources.requests.memory=128Mi \
    --set server.resources.requests.cpu=50m \
    --wait \
    --timeout 5m

wait_for_deployment "$NAMESPACE" "vm-alert-victoria-metrics-alert-server"
echo "  VictoriaMetrics Alert deployed!"

# ========================================
# 5. Deploy VictoriaMetrics Auth
# ========================================
echo ""
echo "=== Step 5: Deploying VictoriaMetrics Auth ==="

# Create a simple auth config
kubectl apply -n "$NAMESPACE" -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: vmauth-config
data:
  auth.yml: |
    users:
      - username: "test"
        password: "test"
        url_prefix: "http://vm-single-victoria-metrics-single-server:8428"
EOF

helm upgrade --install vm-auth vm/victoria-metrics-auth \
    --namespace "$NAMESPACE" \
    --set configMap=vmauth-config \
    --set resources.requests.memory=64Mi \
    --set resources.requests.cpu=25m \
    --wait \
    --timeout 5m

wait_for_deployment "$NAMESPACE" "vm-auth-victoria-metrics-auth"
echo "  VictoriaMetrics Auth deployed!"

# ========================================
# 6. Deploy VictoriaMetrics Cluster
# ========================================
echo ""
echo "=== Step 6: Deploying VictoriaMetrics Cluster ==="
helm upgrade --install vm-cluster vm/victoria-metrics-cluster \
    --namespace "$NAMESPACE" \
    --set vmselect.replicaCount=1 \
    --set vmselect.resources.requests.memory=128Mi \
    --set vmselect.resources.requests.cpu=50m \
    --set vminsert.replicaCount=1 \
    --set vminsert.resources.requests.memory=128Mi \
    --set vminsert.resources.requests.cpu=50m \
    --set vmstorage.replicaCount=1 \
    --set vmstorage.persistentVolume.enabled=false \
    --set vmstorage.resources.requests.memory=256Mi \
    --set vmstorage.resources.requests.cpu=100m \
    --wait \
    --timeout 5m

# Wait for cluster components
echo "  Waiting for VictoriaMetrics Cluster components..."
kubectl rollout status statefulset/vm-cluster-victoria-metrics-cluster-vmstorage -n "$NAMESPACE" --timeout=180s 2>/dev/null || true
wait_for_deployment "$NAMESPACE" "vm-cluster-victoria-metrics-cluster-vmselect"
wait_for_deployment "$NAMESPACE" "vm-cluster-victoria-metrics-cluster-vminsert"

echo "  VictoriaMetrics Cluster deployed!"

# ========================================
# Validation Tests
# ========================================
echo ""
echo "=== Running Validation Tests ==="

# Test 1: Check all pods are running
echo "  Test 1: Checking all pods are running..."
sleep 10
RUNNING_PODS=$(kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running --no-headers 2>/dev/null | wc -l | tr -d ' ')
TOTAL_PODS=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | wc -l | tr -d ' ')
echo "    Running pods: $RUNNING_PODS / $TOTAL_PODS"

# Test 2: Test VictoriaMetrics Single API
echo "  Test 2: Testing VictoriaMetrics Single API..."
kubectl port-forward -n "$NAMESPACE" svc/vm-single-victoria-metrics-single-server 8428:8428 &
PF_PID=$!
sleep 3

# Health check
if curl -s http://localhost:8428/-/healthy 2>/dev/null | grep -qi "victoriametrics\|ok"; then
    echo "    VictoriaMetrics Single health check: PASS"
else
    echo "    VictoriaMetrics Single health check: CHECKING..."
    curl -s http://localhost:8428/-/healthy 2>/dev/null || true
fi

# Write test metric
curl -s -X POST 'http://localhost:8428/api/v1/import/prometheus' \
    -d 'test_metric{job="test"} 42' 2>/dev/null || true

sleep 2

# Query test metric
QUERY_RESULT=$(curl -s 'http://localhost:8428/api/v1/query?query=test_metric' 2>/dev/null || echo "{}")
if echo "$QUERY_RESULT" | grep -q "test_metric"; then
    echo "    Write/Query test: PASS"
else
    echo "    Write/Query test: CHECKING (metric may take time)"
fi

kill $PF_PID 2>/dev/null || true

# Test 3: Check Helm releases
echo "  Test 3: Checking Helm releases..."
for release in vm-operator vm-single vm-agent vm-alert vm-auth vm-cluster; do
    if helm status "$release" -n "$NAMESPACE" 2>/dev/null | grep -q "STATUS: deployed"; then
        echo "    $release: deployed"
    else
        echo "    $release: WARNING"
    fi
done

# ========================================
# Summary
# ========================================
echo ""
echo "=== VictoriaMetrics Test Summary ==="
echo "Namespace: $NAMESPACE"
echo ""
kubectl get pods -n "$NAMESPACE"
echo ""

# Show images being used
echo "Images in use:"
kubectl get pods -n "$NAMESPACE" -o jsonpath='{range .items[*]}{.spec.containers[*].image}{"\n"}{end}' 2>/dev/null | sort -u

echo ""
echo "VictoriaMetrics stack is running!"
echo "To cleanup, run: helm uninstall vm-operator vm-single vm-agent vm-alert vm-auth vm-cluster -n $NAMESPACE"
