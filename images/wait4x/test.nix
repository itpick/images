{ pkgs, image }:

pkgs.writeShellScript "test-wait4x" ''
  set -euo pipefail
  echo "Testing wait4x image..."

  echo "  Testing wait4x --help..."
  docker run --rm ${image.imageName}:test wait4x --help

  echo "  Testing wait4x version..."
  docker run --rm ${image.imageName}:test wait4x version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All wait4x tests passed!"
''
