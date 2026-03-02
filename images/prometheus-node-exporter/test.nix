{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-node-exporter" ''
  set -euo pipefail

  echo "Testing prometheus-node-exporter image..."

  echo "  Testing node_exporter --version..."
  docker run --rm ${image.imageName}:test node_exporter --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All prometheus-node-exporter tests passed!"
''
