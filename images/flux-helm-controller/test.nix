{ pkgs, image }:

pkgs.writeShellScript "test-flux-helm-controller" ''
  set -euo pipefail

  echo "Testing flux-helm-controller image..."

  echo "  Testing helm-controller --help..."
  docker run --rm ${image.imageName}:test helm-controller --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-helm-controller tests passed!"
''
