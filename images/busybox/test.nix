{ pkgs, image }:

pkgs.writeShellScript "test-busybox" ''
  set -euo pipefail

  echo "Testing busybox image..."

  echo "  Testing busybox --help..."
  docker run --rm ${image.imageName}:test busybox --help

  echo "  Testing sh works..."
  docker run --rm ${image.imageName}:test sh -c "echo hello" | grep -q "hello"

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All busybox tests passed!"
''
