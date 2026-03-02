{ pkgs, image }:

pkgs.writeShellScript "test-flux-image-reflector-controller" ''
  set -euo pipefail

  echo "Testing flux-image-reflector-controller image..."

  echo "  Testing image-reflector-controller --help..."
  docker run --rm ${image.imageName}:test image-reflector-controller --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-image-reflector-controller tests passed!"
''
