{ pkgs, image }:

pkgs.writeShellScript "test-flux-kustomize-controller" ''
  set -euo pipefail

  echo "Testing flux-kustomize-controller image..."

  echo "  Testing kustomize-controller --help..."
  docker run --rm ${image.imageName}:test kustomize-controller --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-kustomize-controller tests passed!"
''
