{ pkgs, image }:

pkgs.writeShellScript "test-kube-state-metrics" ''
  set -euo pipefail

  echo "Testing kube-state-metrics image..."

  echo "  Testing kube-state-metrics --help..."
  docker run --rm ${image.imageName}:test kube-state-metrics --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All kube-state-metrics tests passed!"
''
