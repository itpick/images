{ pkgs, image }:

pkgs.writeShellScript "test-flux-source-watcher" ''
  set -euo pipefail
  echo "Testing flux-source-watcher image..."

  echo "  Testing source-watcher --help..."
  docker run --rm ${image.imageName}:test source-watcher --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All flux-source-watcher tests passed!"
''
