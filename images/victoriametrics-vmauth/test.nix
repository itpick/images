{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmauth" ''
  set -euo pipefail

  echo "Testing victoriametrics-vmauth image..."

  echo "  Testing vmauth --version..."
  docker run --rm ${image.imageName}:test vmauth --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All victoriametrics-vmauth tests passed!"
''
