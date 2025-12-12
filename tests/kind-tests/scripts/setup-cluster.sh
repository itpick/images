#!/usr/bin/env bash
# Setup Kind cluster for testing nix-containers images
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$(dirname "$SCRIPT_DIR")/configs"

echo "=== Setting up Kind cluster: $CLUSTER_NAME ==="

# Check prerequisites
for cmd in kind kubectl helm docker; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "ERROR: $cmd is required but not installed"
        exit 1
    fi
done

# Check if cluster already exists
if kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "Cluster $CLUSTER_NAME already exists"
    echo "Use 'make cluster-down' to delete it first, or use existing cluster"
    exit 0
fi

# Create cluster
echo "Creating Kind cluster..."
kind create cluster \
    --name "$CLUSTER_NAME" \
    --config "$CONFIG_DIR/kind-config.yaml" \
    --wait 5m

# Set kubeconfig and make it the default context
export KUBECONFIG="${HOME}/.kube/kind-${CLUSTER_NAME}"
kind get kubeconfig --name "$CLUSTER_NAME" > "$KUBECONFIG"

# Also merge into default kubeconfig and set as current context
kind export kubeconfig --name "$CLUSTER_NAME"
kubectl config use-context "kind-${CLUSTER_NAME}"

echo "Cluster created. Kubeconfig: $KUBECONFIG"
echo "Current context set to: kind-${CLUSTER_NAME}"

# Wait for nodes to be ready
echo "Waiting for nodes to be ready..."
kubectl wait --for=condition=Ready nodes --all --timeout=300s

# Install metrics-server (optional but useful)
echo "Installing metrics-server..."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml 2>/dev/null || true
# Patch for Kind compatibility
kubectl patch deployment metrics-server -n kube-system --type='json' -p='[
  {"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"},
  {"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-preferred-address-types=InternalIP"}
]' 2>/dev/null || true

# Create namespaces for testing
echo "Creating test namespaces..."
for ns in infrastructure ml-platform gitops security observability service-mesh backup; do
    kubectl create namespace "$ns" --dry-run=client -o yaml | kubectl apply -f -
done

# Add common Helm repos
echo "Adding Helm repositories..."
helm repo add jetstack https://charts.jetstack.io 2>/dev/null || true
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 2>/dev/null || true
helm repo add grafana https://grafana.github.io/helm-charts 2>/dev/null || true
helm repo add hashicorp https://helm.releases.hashicorp.com 2>/dev/null || true
helm repo add argoproj https://argoproj.github.io/argo-helm 2>/dev/null || true
helm repo add istio https://istio-release.storage.googleapis.com/charts 2>/dev/null || true
helm repo add kyverno https://kyverno.github.io/kyverno 2>/dev/null || true
helm repo add external-secrets https://charts.external-secrets.io 2>/dev/null || true
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts 2>/dev/null || true
helm repo add crossplane https://charts.crossplane.io/stable 2>/dev/null || true
helm repo add keda https://kedacore.github.io/charts 2>/dev/null || true
helm repo add rook https://charts.rook.io/release 2>/dev/null || true
helm repo add vm https://victoriametrics.github.io/helm-charts 2>/dev/null || true
helm repo update

echo ""
echo "=== Kind cluster $CLUSTER_NAME is ready ==="
echo "Export KUBECONFIG=$KUBECONFIG"
echo "Run 'make load-images' to load nix container images"
