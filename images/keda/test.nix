{ pkgs, image }:

pkgs.writeShellScript "test-keda" ''
  set -euo pipefail

  echo "Testing keda image..."

  echo "  Testing keda --help..."
  docker run --rm ${image.imageName}:test keda --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All keda tests passed!"
''
