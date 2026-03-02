{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmalert" ''
  set -euo pipefail

  echo "Testing victoriametrics-vmalert image..."

  echo "  Testing vmalert --version..."
  docker run --rm ${image.imageName}:test vmalert --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All victoriametrics-vmalert tests passed!"
''
