{ pkgs, image }:

pkgs.writeShellScript "test-flux-image-automation-controller" ''
  set -euo pipefail

  echo "Testing flux-image-automation-controller image..."

  echo "  Testing image-automation-controller --help..."
  docker run --rm ${image.imageName}:test image-automation-controller --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-image-automation-controller tests passed!"
''
