{ pkgs, image }:

pkgs.writeShellScript "test-external-dns" ''
  set -euo pipefail

  echo "Testing external-dns image..."

  echo "  Testing external-dns --help..."
  docker run --rm ${image.imageName}:test external-dns --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All external-dns tests passed!"
''
