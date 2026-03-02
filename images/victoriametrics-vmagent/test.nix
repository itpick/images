{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmagent" ''
  set -euo pipefail

  echo "Testing victoriametrics-vmagent image..."

  echo "  Testing vmagent --version..."
  docker run --rm ${image.imageName}:test vmagent --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All victoriametrics-vmagent tests passed!"
''
