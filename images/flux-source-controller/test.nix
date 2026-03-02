{ pkgs, image }:

pkgs.writeShellScript "test-flux-source-controller" ''
  set -euo pipefail

  echo "Testing flux-source-controller image..."

  echo "  Testing source-controller --help..."
  docker run --rm ${image.imageName}:test source-controller --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-source-controller tests passed!"
''
