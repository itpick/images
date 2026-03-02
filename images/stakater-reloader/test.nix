{ pkgs, image }:

pkgs.writeShellScript "test-stakater-reloader" ''
  set -euo pipefail

  echo "Testing stakater-reloader image..."

  echo "  Testing container runs..."
  docker run --rm ${image.imageName}:test sh -c "echo ok"

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All stakater-reloader tests passed!"
''
