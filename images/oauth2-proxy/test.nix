{ pkgs, image }:

pkgs.writeShellScript "test-oauth2-proxy" ''
  set -euo pipefail

  echo "Testing oauth2-proxy image..."

  echo "  Testing oauth2-proxy --version..."
  docker run --rm ${image.imageName}:test oauth2-proxy --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All oauth2-proxy tests passed!"
''
