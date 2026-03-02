{ pkgs, image }:

pkgs.writeShellScript "test-cloudnative-pg" ''
  set -euo pipefail

  echo "Testing cloudnative-pg image..."

  echo "  Testing manager --help..."
  docker run --rm ${image.imageName}:test manager --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All cloudnative-pg tests passed!"
''
