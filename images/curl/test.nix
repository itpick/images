{ pkgs, image }:

pkgs.writeShellScript "test-curl" ''
  set -euo pipefail

  echo "Testing curl image..."

  echo "  Testing curl --version..."
  docker run --rm ${image.imageName}:test curl --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All curl tests passed!"
''
