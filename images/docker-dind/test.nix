{ pkgs, image }:

pkgs.writeShellScript "test-docker-dind" ''
  set -euo pipefail

  echo "Testing docker-dind image..."

  echo "  Testing docker --version..."
  docker run --rm ${image.imageName}:test docker --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All docker-dind tests passed!"
''
