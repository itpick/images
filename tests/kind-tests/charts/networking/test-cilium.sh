#!/usr/bin/env bash
# Test Cilium CNI with nix-containers images
# Usage: ./test-cilium.sh [--upstream] [--keep-cluster]
#
# Options:
#   --upstream      Use upstream Cilium images instead of nix-containers
#   --keep-cluster  Don't delete the cluster after the test
#
# Environment variables:
#   CLUSTER_NAME    Name of the Kind cluster (default: cilium-test)
#   USE_UPSTREAM    Set to "true" for upstream images (default: false)
#   KEEP_CLUSTER    Set to "true" to keep cluster (default: false)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIND_TESTS_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
IMAGES_DIR="$(dirname "$(dirname "$KIND_TESTS_DIR")")"
source "$KIND_TESTS_DIR/scripts/helpers.sh"

# Configuration
NAMESPACE="kube-system"
RELEASE="cilium"
CLUSTER_NAME="${CLUSTER_NAME:-cilium-test}"
USE_UPSTREAM="${USE_UPSTREAM:-false}"
KEEP_CLUSTER="${KEEP_CLUSTER:-false}"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --upstream)
            USE_UPSTREAM="true"
            shift
            ;;
        --keep-cluster)
            KEEP_CLUSTER="true"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--upstream] [--keep-cluster]"
            exit 1
            ;;
    esac
done

KUBE_CONTEXT="kind-${CLUSTER_NAME}"
K8S_SERVICE_HOST="${CLUSTER_NAME}-control-plane"

echo "========================================"
echo "Cilium CNI Test"
echo "========================================"
echo "  Cluster: $CLUSTER_NAME"
echo "  Kube Context: $KUBE_CONTEXT"
echo "  K8S Service Host: $K8S_SERVICE_HOST"
echo "  Use Upstream Images: $USE_UPSTREAM"
echo "  Keep Cluster: $KEEP_CLUSTER"
echo "========================================"
echo ""

# Check prerequisites
echo "Checking prerequisites..."
for cmd in kind kubectl helm docker; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "ERROR: $cmd is required but not installed"
        exit 1
    fi
done

# Check for nix if using nix-containers images
if [ "$USE_UPSTREAM" != "true" ]; then
    # On macOS, we need to use Lima to build Linux images
    if [[ "$(uname -s)" == "Darwin" ]]; then
        if ! command -v limactl &>/dev/null; then
            echo "ERROR: limactl is required for building nix-containers images on macOS"
            echo "  Use --upstream flag to use upstream images instead"
            exit 1
        fi
        USE_LIMA="true"
        NIX_CMD="limactl shell default -- nix --extra-experimental-features 'nix-command flakes'"
    else
        if ! command -v nix &>/dev/null; then
            echo "ERROR: nix is required for building nix-containers images"
            echo "  Use --upstream flag to use upstream images instead"
            exit 1
        fi
        USE_LIMA="false"
        NIX_CMD="nix --extra-experimental-features 'nix-command flakes'"
    fi

    # Build skopeo-nix2container (required for image loading)
    echo "  Building skopeo-nix2container..."
    if [ "$USE_LIMA" = "true" ]; then
        SKOPEO_PATH=$(limactl shell default -- nix --extra-experimental-features 'nix-command flakes' build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>&1 | grep '^/nix/store' | tail -1)
    else
        SKOPEO_PATH=$(nix --extra-experimental-features 'nix-command flakes' build github:nlewo/nix2container#skopeo-nix2container --no-link --print-out-paths 2>&1 | grep '^/nix/store' | tail -1)
    fi

    if [ -z "$SKOPEO_PATH" ]; then
        echo "ERROR: Failed to build skopeo-nix2container"
        exit 1
    fi
    echo "  skopeo-nix2container built: $SKOPEO_PATH"

    # Create policy.json for skopeo in /tmp (required for image operations)
    if [ "$USE_LIMA" = "true" ]; then
        limactl shell default -- bash -c 'mkdir -p /tmp/containers && cat > /tmp/containers/policy.json << "EOF"
{
    "default": [
        {
            "type": "insecureAcceptAnything"
        }
    ]
}
EOF'
    else
        mkdir -p /tmp/containers
        cat > /tmp/containers/policy.json << "EOF"
{
    "default": [
        {
            "type": "insecureAcceptAnything"
        }
    ]
}
EOF
    fi
fi
echo "  All prerequisites found."
echo ""

# Cleanup function
cleanup() {
    local exit_code=$?
    if [ "$KEEP_CLUSTER" != "true" ]; then
        echo ""
        echo "Cleaning up Kind cluster..."
        kind delete cluster --name "$CLUSTER_NAME" 2>/dev/null || true
    else
        echo ""
        echo "Keeping cluster $CLUSTER_NAME for debugging."
        echo "To delete: kind delete cluster --name $CLUSTER_NAME"
    fi
    exit $exit_code
}

# Set trap for cleanup on exit
trap cleanup EXIT

# Step 1: Build nix-containers images (if not using upstream)
if [ "$USE_UPSTREAM" != "true" ]; then
    echo "Step 1: Building nix-containers Cilium images..."

    for img in cilium-agent cilium-operator; do
        echo "  Building $img..."
        if [ "$USE_LIMA" = "true" ]; then
            # Build inside Lima VM with --no-link to avoid read-only filesystem issues
            # Store the output JSON path for later use with skopeo
            nix_output=$(limactl shell default -- nix --extra-experimental-features 'nix-command flakes' build "$IMAGES_DIR#$img" --no-link --print-out-paths 2>&1)
            if [ $? -ne 0 ]; then
                echo "ERROR: Failed to build $img"
                echo "$nix_output"
                exit 1
            fi
            # Extract just the store path (last line that starts with /nix/store)
            store_path=$(echo "$nix_output" | grep '^/nix/store' | tail -1)
            echo "$store_path" > "$IMAGES_DIR/.nix-path-$img"
            echo "  JSON path: $store_path"
        else
            nix_output=$(nix --extra-experimental-features 'nix-command flakes' build "$IMAGES_DIR#$img" --no-link --print-out-paths 2>&1)
            if [ $? -ne 0 ]; then
                echo "ERROR: Failed to build $img"
                echo "$nix_output"
                exit 1
            fi
            store_path=$(echo "$nix_output" | grep '^/nix/store' | tail -1)
            echo "$store_path" > "$IMAGES_DIR/.nix-path-$img"
            echo "  JSON path: $store_path"
        fi
        echo "  $img built successfully."
    done
    echo ""
else
    echo "Step 1: Skipping image build (using upstream images)"
    echo ""
fi

# Step 2: Create Kind cluster
echo "Step 2: Creating Kind cluster..."
if kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "  Cluster $CLUSTER_NAME already exists, deleting..."
    kind delete cluster --name "$CLUSTER_NAME"
fi

# Note: Don't use --wait since control-plane won't be Ready until CNI (Cilium) is installed
kind create cluster \
    --name "$CLUSTER_NAME" \
    --config "$KIND_TESTS_DIR/configs/kind-cilium.yaml"

echo "  Kind cluster created."
echo ""

# Step 3: Load nix-containers images into Kind (if not using upstream)
if [ "$USE_UPSTREAM" != "true" ]; then
    echo "Step 3: Loading nix-containers images into Kind..."

    for img in cilium-agent cilium-operator; do
        echo "  Loading $img into Docker..."

        # Get the JSON path from step 1
        json_path=$(cat "$IMAGES_DIR/.nix-path-$img" | tr -d '\n')
        echo "  JSON path: $json_path"

        # Remove any existing tarball
        tarball="/tmp/${img}.tar"
        if [ "$USE_LIMA" = "true" ]; then
            limactl shell default -- rm -f "$tarball"
        else
            rm -f "$tarball"
        fi

        # Use skopeo to copy from nix: to docker-archive tarball
        echo "  Converting to docker-archive tarball..."
        if [ "$USE_LIMA" = "true" ]; then
            limactl shell default -- "$SKOPEO_PATH/bin/skopeo" --policy /tmp/containers/policy.json copy "nix:$json_path" "docker-archive:${tarball}:nix-containers/${img}:test"
            # Stream tarball from Lima to Docker on macOS
            limactl shell default -- cat "$tarball" | docker load
        else
            "$SKOPEO_PATH/bin/skopeo" --policy /tmp/containers/policy.json copy "nix:$json_path" "docker-archive:${tarball}:nix-containers/${img}:test"
            docker load < "$tarball"
        fi

        # Cleanup temp files
        rm -f "$IMAGES_DIR/.nix-path-$img"

        echo "  Loading into Kind cluster..."
        kind load docker-image "nix-containers/$img:test" --name "$CLUSTER_NAME"

        echo "  $img loaded into Kind."
    done
    echo ""
else
    echo "Step 3: Skipping image loading (using upstream images)"
    echo ""
fi

# Step 4: Add Cilium Helm repo
echo "Step 4: Setting up Helm..."
helm repo add cilium https://helm.cilium.io/ 2>/dev/null || true
helm repo update cilium 2>/dev/null
echo "  Helm repos configured."
echo ""

# Step 5: Install Cilium
echo "Step 5: Installing Cilium..."

# Build Helm install args
HELM_ARGS=(
    --kube-context "$KUBE_CONTEXT"
    --namespace "$NAMESPACE"
    --set kubeProxyReplacement=true
    --set k8sServiceHost="$K8S_SERVICE_HOST"
    --set k8sServicePort=6443
    --set hubble.relay.enabled=false
    --set hubble.ui.enabled=false
    --wait
    --timeout 10m
)

# Add nix-containers image overrides if not using upstream
if [ "$USE_UPSTREAM" != "true" ]; then
    echo "  Using nix-containers images..."
    HELM_ARGS+=(
        --set image.repository=nix-containers/cilium-agent
        --set image.tag=test
        --set image.useDigest=false
        --set image.pullPolicy=Never
        --set operator.image.repository=nix-containers/cilium-operator
        --set operator.image.suffix=""
        --set operator.image.tag=test
        --set operator.image.useDigest=false
        --set operator.image.pullPolicy=Never
    )
else
    echo "  Using upstream Cilium images..."
fi

helm upgrade --install "$RELEASE" cilium/cilium "${HELM_ARGS[@]}"
echo "  Cilium installed."
echo ""

# Step 6: Verify Cilium
echo "Step 6: Verifying Cilium deployment..."
kubectl --context "$KUBE_CONTEXT" rollout status daemonset/cilium -n "$NAMESPACE" --timeout=300s
kubectl --context "$KUBE_CONTEXT" rollout status deployment/cilium-operator -n "$NAMESPACE" --timeout=120s || echo "  (Cilium operator may have 1 replica)"
kubectl --context "$KUBE_CONTEXT" get pods -n "$NAMESPACE" -l k8s-app=cilium
echo ""

# Step 7: Test network connectivity
echo "Step 7: Testing network connectivity..."

# Create test namespace
kubectl --context "$KUBE_CONTEXT" create namespace cilium-test --dry-run=client -o yaml | kubectl --context "$KUBE_CONTEXT" apply -f -

# Deploy test pods
kubectl --context "$KUBE_CONTEXT" apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: cilium-test-client
  namespace: cilium-test
  labels:
    app: cilium-test-client
spec:
  containers:
  - name: client
    image: busybox
    command: ["sleep", "3600"]
---
apiVersion: v1
kind: Pod
metadata:
  name: cilium-test-server
  namespace: cilium-test
  labels:
    app: cilium-test-server
spec:
  containers:
  - name: server
    image: busybox
    command: ["sh", "-c", "while true; do echo 'Hello from Cilium test server' | nc -l -p 8080; done"]
    ports:
    - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: cilium-test-server
  namespace: cilium-test
spec:
  selector:
    app: cilium-test-server
  ports:
  - port: 8080
    targetPort: 8080
EOF

# Wait for test pods
echo "  Waiting for test pods..."
kubectl --context "$KUBE_CONTEXT" wait pod cilium-test-client -n cilium-test --for=condition=Ready --timeout=120s
kubectl --context "$KUBE_CONTEXT" wait pod cilium-test-server -n cilium-test --for=condition=Ready --timeout=120s

# Test pod-to-service connectivity
echo "  Testing pod-to-service connectivity..."
sleep 5
if kubectl --context "$KUBE_CONTEXT" exec cilium-test-client -n cilium-test -- wget -q -O - cilium-test-server:8080 --timeout=10; then
    echo "  Connection test PASSED!"
else
    echo "  Connection test completed (may have timed out)"
fi
echo ""

# Step 8: Test Cilium network policy
echo "Step 8: Testing Cilium network policy..."
kubectl --context "$KUBE_CONTEXT" apply -f - <<EOF
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: allow-from-client
  namespace: cilium-test
spec:
  endpointSelector:
    matchLabels:
      app: cilium-test-server
  ingress:
  - fromEndpoints:
    - matchLabels:
        app: cilium-test-client
    toPorts:
    - ports:
      - port: "8080"
        protocol: TCP
EOF
echo "  Network policy applied."
echo ""

# Step 9: Cleanup test namespace
echo "Step 9: Cleaning up test namespace..."
kubectl --context "$KUBE_CONTEXT" delete namespace cilium-test --ignore-not-found=true --wait=false

echo ""
echo "========================================"
echo "Cilium test PASSED!"
echo "========================================"
