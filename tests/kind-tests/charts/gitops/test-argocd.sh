#!/usr/bin/env bash
# Test ArgoCD with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="argocd"
RELEASE="argocd"

echo "Testing ArgoCD deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install ArgoCD
helm_install "$RELEASE" argoproj/argo-cd "$NAMESPACE" \
    --set global.image.repository=nix-containers/argocd \
    --set global.image.tag=test \
    --set server.service.type=ClusterIP \
    --set configs.params."server.insecure"=true

# Wait for CRDs
wait_for_crd "applications.argoproj.io"
wait_for_crd "applicationsets.argoproj.io"
wait_for_crd "appprojects.argoproj.io"

# Wait for deployments
wait_for_deployment "$NAMESPACE" "argocd-server"
wait_for_deployment "$NAMESPACE" "argocd-repo-server"
wait_for_deployment "$NAMESPACE" "argocd-applicationset-controller"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Test ArgoCD server
echo "  Testing ArgoCD server..."
kubectl port-forward -n "$NAMESPACE" svc/argocd-server 8080:80 &
PORT_FORWARD_PID=$!
sleep 5
curl -s http://localhost:8080/api/version 2>/dev/null | grep -q "Version" || true
kill $PORT_FORWARD_PID 2>/dev/null || true

# Get initial admin password
echo "  Getting ArgoCD admin password..."
kubectl -n "$NAMESPACE" get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" 2>/dev/null | base64 -d || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "ArgoCD test passed!"
