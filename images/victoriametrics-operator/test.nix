{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-operator" ''
  set -euo pipefail

  echo "Testing victoriametrics-operator image..."

  echo "  Testing vm-operator --help..."
  docker run --rm ${image.imageName}:test vm-operator --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All victoriametrics-operator tests passed!"
''
