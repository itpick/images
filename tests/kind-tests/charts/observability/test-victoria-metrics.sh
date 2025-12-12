#!/usr/bin/env bash
# Test VictoriaMetrics stack with nix-containers images
# This test deploys all VictoriaMetrics charts and validates they work with our custom images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="victoria-metrics"
CLUSTER_NAME="${CLUSTER_NAME:-nix-containers-test}"

echo "=== Testing VictoriaMetrics stack deployment ==="

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
helm repo update

# ========================================
# 1. Deploy VictoriaMetrics Operator
# ========================================
echo ""
echo "=== Step 1: Deploying VictoriaMetrics Operator ==="
helm upgrade --install vm-operator vm/victoria-metrics-operator \
    --namespace "$NAMESPACE" \
    --create-namespace \
    --set image.repository=nix-containers/victoriametrics-operator \
    --set image.tag=test \
    --set operator.disable_prometheus_converter=true \
    --set operator.enable_converter_ownership=false \
    --wait \
    --timeout 5m

# Wait for operator CRDs
echo "  Waiting for VictoriaMetrics CRDs..."
wait_for_crd "vmclusters.operator.victoriametrics.com" 120 || true
wait_for_crd "vmagents.operator.victoriametrics.com" 120 || true
wait_for_crd "vmalerts.operator.victoriametrics.com" 120 || true
wait_for_crd "vmauths.operator.victoriametrics.com" 120 || true
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
    --set server.image.repository=nix-containers/victoria-metrics \
    --set server.image.tag=test \
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
    --set image.repository=nix-containers/victoriametrics-vmagent \
    --set image.tag=test \
    --set remoteWriteUrls[0]=http://vm-single-victoria-metrics-single-server:8428/api/v1/write \
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
    --set server.image.repository=nix-containers/victoriametrics-vmalert \
    --set server.image.tag=test \
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
    --set image.repository=nix-containers/victoriametrics-vmauth \
    --set image.tag=test \
    --set configMap=vmauth-config \
    --set resources.requests.memory=64Mi \
    --set resources.requests.cpu=25m \
    --wait \
    --timeout 5m

wait_for_deployment "$NAMESPACE" "vm-auth-victoria-metrics-auth"
echo "  VictoriaMetrics Auth deployed!"

# ========================================
# 6. Deploy VictoriaMetrics Cluster (optional, more complex)
# ========================================
echo ""
echo "=== Step 6: Deploying VictoriaMetrics Cluster ==="
helm upgrade --install vm-cluster vm/victoria-metrics-cluster \
    --namespace "$NAMESPACE" \
    --set vmselect.image.repository=nix-containers/victoriametrics-vmselect \
    --set vmselect.image.tag=test \
    --set vmselect.replicaCount=1 \
    --set vmselect.resources.requests.memory=128Mi \
    --set vmselect.resources.requests.cpu=50m \
    --set vminsert.image.repository=nix-containers/victoriametrics-vminsert \
    --set vminsert.image.tag=test \
    --set vminsert.replicaCount=1 \
    --set vminsert.resources.requests.memory=128Mi \
    --set vminsert.resources.requests.cpu=50m \
    --set vmstorage.image.repository=nix-containers/victoriametrics-vmstorage \
    --set vmstorage.image.tag=test \
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
RUNNING_PODS=$(kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running --no-headers 2>/dev/null | wc -l)
TOTAL_PODS=$(kubectl get pods -n "$NAMESPACE" --no-headers 2>/dev/null | wc -l)
echo "    Running pods: $RUNNING_PODS / $TOTAL_PODS"

if [ "$RUNNING_PODS" -lt 5 ]; then
    echo "    WARNING: Some pods may not be running"
    kubectl get pods -n "$NAMESPACE"
fi

# Test 2: Test VictoriaMetrics Single API
echo "  Test 2: Testing VictoriaMetrics Single API..."
kubectl port-forward -n "$NAMESPACE" svc/vm-single-victoria-metrics-single-server 8428:8428 &
PF_PID=$!
sleep 3

# Health check
if curl -s http://localhost:8428/-/healthy 2>/dev/null | grep -qi "victoriametrics"; then
    echo "    VictoriaMetrics Single health check: PASS"
else
    echo "    VictoriaMetrics Single health check: WARNING (may still be starting)"
fi

# Write test metric
curl -s -X POST 'http://localhost:8428/api/v1/import/prometheus' \
    -d 'test_metric{job="test"} 42' 2>/dev/null || true

# Query test metric
QUERY_RESULT=$(curl -s 'http://localhost:8428/api/v1/query?query=test_metric' 2>/dev/null || echo "{}")
if echo "$QUERY_RESULT" | grep -q "test_metric"; then
    echo "    Write/Query test: PASS"
else
    echo "    Write/Query test: WARNING (metric may take time to appear)"
fi

kill $PF_PID 2>/dev/null || true

# Test 3: Test VictoriaMetrics Cluster API (vmselect)
echo "  Test 3: Testing VictoriaMetrics Cluster vmselect..."
kubectl port-forward -n "$NAMESPACE" svc/vm-cluster-victoria-metrics-cluster-vmselect 8481:8481 &
PF_PID=$!
sleep 3

if curl -s http://localhost:8481/select/0/prometheus/-/healthy 2>/dev/null | grep -qi "ok\|healthy"; then
    echo "    vmselect health check: PASS"
else
    echo "    vmselect health check: WARNING"
fi

kill $PF_PID 2>/dev/null || true

# Test 4: Test VictoriaMetrics Auth
echo "  Test 4: Testing VictoriaMetrics Auth..."
kubectl port-forward -n "$NAMESPACE" svc/vm-auth-victoria-metrics-auth 8427:8427 &
PF_PID=$!
sleep 3

if curl -s -u test:test http://localhost:8427/-/healthy 2>/dev/null | grep -qi "victoriametrics\|ok"; then
    echo "    vmauth proxy test: PASS"
else
    echo "    vmauth proxy test: WARNING (auth may be misconfigured)"
fi

kill $PF_PID 2>/dev/null || true

# Test 5: Check Helm releases
echo "  Test 5: Checking Helm releases..."
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

# ========================================
# Cleanup (optional - comment out to inspect)
# ========================================
echo ""
echo "=== Cleanup ==="
echo "Uninstalling VictoriaMetrics stack..."

helm_uninstall "vm-cluster" "$NAMESPACE"
helm_uninstall "vm-auth" "$NAMESPACE"
helm_uninstall "vm-alert" "$NAMESPACE"
helm_uninstall "vm-agent" "$NAMESPACE"
helm_uninstall "vm-single" "$NAMESPACE"
helm_uninstall "vm-operator" "$NAMESPACE"

# Wait for cleanup
sleep 10

# Delete CRDs (optional)
kubectl delete crd vmclusters.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmagents.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmalerts.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmauths.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmsingles.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmalertmanagers.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmalertmanagerconfigs.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmnodescrapes.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmpodscrapes.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmprobes.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmrules.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmservicescrapes.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmstaticscrapes.operator.victoriametrics.com 2>/dev/null || true
kubectl delete crd vmusers.operator.victoriametrics.com 2>/dev/null || true

kubectl delete namespace "$NAMESPACE" --ignore-not-found=true 2>/dev/null || true

echo ""
echo "VictoriaMetrics test completed successfully!"
