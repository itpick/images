{ pkgs, image }:

pkgs.writeShellScript "test-keda-metrics-apiserver" ''
  set -euo pipefail

  echo "Testing keda-metrics-apiserver image..."

  echo "  Testing keda-adapter --help..."
  docker run --rm ${image.imageName}:test keda-adapter --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All keda-metrics-apiserver tests passed!"
''
