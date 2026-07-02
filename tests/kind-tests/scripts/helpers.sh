#!/usr/bin/env bash
# Helper functions for Kind testing

# Wait for deployment to be ready
wait_for_deployment() {
    local namespace="$1"
    local deployment="$2"
    local timeout="${3:-300}"

    echo "  Waiting for deployment $deployment in $namespace..."
    kubectl rollout status deployment/"$deployment" \
        -n "$namespace" \
        --timeout="${timeout}s" 2>/dev/null
}

# Wait for pod to be ready
wait_for_pod() {
    local namespace="$1"
    local label="$2"
    local timeout="${3:-300}"

    echo "  Waiting for pod with label $label in $namespace..."
    kubectl wait pod \
        -n "$namespace" \
        -l "$label" \
        --for=condition=Ready \
        --timeout="${timeout}s" 2>/dev/null
}

# Wait for CRD to be established
wait_for_crd() {
    local crd="$1"
    local timeout="${2:-60}"

    echo "  Waiting for CRD $crd..."
    kubectl wait crd "$crd" \
        --for=condition=Established \
        --timeout="${timeout}s" 2>/dev/null
}

# Install Helm chart
helm_install() {
    local release="$1"
    local chart="$2"
    local namespace="$3"
    shift 3
    local extra_args=("$@")

    echo "  Installing Helm chart $chart as $release..."
    # Capture stderr into a buffer so successful installs stay quiet
    # (matches the prior 2>/dev/null behavior) but failures still surface
    # the actual helm error — before this, every helm-install failure
    # in CI showed as a mysterious exit 1 with nothing to diagnose.
    local err
    err=$(helm upgrade --install "$release" "$chart" \
        --namespace "$namespace" \
        --create-namespace \
        --wait \
        --timeout 5m \
        "${extra_args[@]}" 2>&1 >/dev/null) && return 0
    local rc=$?
    echo "  helm install failed (exit $rc):" >&2
    echo "$err" >&2
    return $rc
}

# Uninstall Helm chart
helm_uninstall() {
    local release="$1"
    local namespace="$2"

    echo "  Uninstalling Helm release $release..."
    helm uninstall "$release" -n "$namespace" 2>/dev/null || true
}

# Check if image exists in cluster
check_image_exists() {
    local image="$1"

    docker exec "${CLUSTER_NAME:-nix-containers-test}-control-plane" \
        crictl images 2>/dev/null | grep -q "$image"
}

# Override image in Helm values
override_image() {
    local repository="$1"
    local tag="$2"

    echo "--set image.repository=$repository --set image.tag=$tag"
}

# Create test namespace
create_test_namespace() {
    local namespace="$1"

    kubectl create namespace "$namespace" --dry-run=client -o yaml | kubectl apply -f -
}

# Cleanup test namespace
cleanup_test_namespace() {
    local namespace="$1"

    kubectl delete namespace "$namespace" --ignore-not-found=true --wait=false 2>/dev/null || true
}

# Run pod and check output
run_test_pod() {
    local namespace="$1"
    local image="$2"
    local command="$3"
    local expected="$4"

    local pod_name="test-pod-$(date +%s)"

    kubectl run "$pod_name" \
        -n "$namespace" \
        --image="$image" \
        --restart=Never \
        --rm \
        -it \
        --command -- $command 2>&1 | grep -q "$expected"
}

# Check Helm release status
check_helm_release() {
    local release="$1"
    local namespace="$2"

    helm status "$release" -n "$namespace" 2>/dev/null | grep -q "STATUS: deployed"
}

# Get pod logs
get_pod_logs() {
    local namespace="$1"
    local label="$2"
    local lines="${3:-50}"

    kubectl logs -n "$namespace" -l "$label" --tail="$lines" 2>/dev/null
}

# Port forward (background)
port_forward() {
    local namespace="$1"
    local service="$2"
    local local_port="$3"
    local remote_port="$4"

    kubectl port-forward -n "$namespace" "svc/$service" "$local_port:$remote_port" &
    sleep 2
}

# Kill port forward
kill_port_forward() {
    pkill -f "kubectl port-forward" 2>/dev/null || true
}
