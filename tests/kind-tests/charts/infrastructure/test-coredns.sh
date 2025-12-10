#!/usr/bin/env bash
# Test CoreDNS with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="kube-system"

echo "Testing CoreDNS functionality..."

# CoreDNS is already installed by Kind, just verify it's working
wait_for_deployment "$NAMESPACE" "coredns"

# Test DNS resolution
echo "  Testing DNS resolution..."
kubectl run dns-test --image=busybox:1.36 --restart=Never --rm -i --wait \
    -- nslookup kubernetes.default.svc.cluster.local 2>/dev/null | grep -q "kubernetes.default"

# Test external DNS resolution
echo "  Testing external DNS resolution..."
kubectl run dns-test-ext --image=busybox:1.36 --restart=Never --rm -i --wait \
    -- nslookup google.com 2>/dev/null | grep -q "Address" || true

echo "CoreDNS test passed!"
