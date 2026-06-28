#!/usr/bin/env bash
# Test community-charts/mlflow with nix-containers images.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$(dirname "$(dirname "$SCRIPT_DIR")")/scripts/helpers.sh"

NAMESPACE="mlflow"
RELEASE="mlflow"

echo "Testing MLflow deployment..."

helm_uninstall "$RELEASE" "$NAMESPACE"

helm repo add community-charts https://community-charts.github.io/helm-charts 2>/dev/null || true
helm repo update community-charts >/dev/null

helm_install "$RELEASE" community-charts/mlflow "$NAMESPACE" \
    --set image.repository=nix-containers/mlflow \
    --set image.tag=test \
    --set backendStore.databaseMigration=false

wait_for_deployment "$NAMESPACE" "mlflow"
check_helm_release "$RELEASE" "$NAMESPACE"

helm_uninstall "$RELEASE" "$NAMESPACE"
echo "MLflow test passed!"
