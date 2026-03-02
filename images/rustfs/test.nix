{ pkgs, image }:

pkgs.writeShellScript "test-rustfs" ''
  set -euo pipefail
  echo "Testing rustfs image..."

  echo "  Testing rustfs --help..."
  docker run --rm ${image.imageName}:test rustfs --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All rustfs tests passed!"
''
