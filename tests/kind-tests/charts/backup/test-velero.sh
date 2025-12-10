#!/usr/bin/env bash
# Test Velero with nix-containers images
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="velero"
RELEASE="velero"

echo "Testing Velero deployment..."

# Cleanup any previous installation
helm_uninstall "$RELEASE" "$NAMESPACE"

# Install Velero (without cloud provider for testing)
helm_install "$RELEASE" vmware-tanzu/velero "$NAMESPACE" \
    --set image.repository=nix-containers/velero \
    --set image.tag=test \
    --set initContainers=null \
    --set deployNodeAgent=false \
    --set configuration.backupStorageLocation=null \
    --set configuration.volumeSnapshotLocation=null \
    --set snapshotsEnabled=false

# Wait for CRDs
wait_for_crd "backups.velero.io"
wait_for_crd "restores.velero.io"
wait_for_crd "schedules.velero.io"

# Wait for deployment
wait_for_deployment "$NAMESPACE" "velero"

# Verify release status
check_helm_release "$RELEASE" "$NAMESPACE"

# Test Velero CLI (if available in the image)
echo "  Testing Velero CLI..."
kubectl exec -n "$NAMESPACE" deploy/velero -- velero version --client-only 2>/dev/null || true

# Cleanup
helm_uninstall "$RELEASE" "$NAMESPACE"

echo "Velero test passed!"
