{ pkgs, image }:

pkgs.writeShellScript "test-forgejo" ''
  set -euo pipefail
  echo "Testing forgejo image..."

  echo "  Testing gitea --help..."
  docker run --rm --entrypoint gitea ${image.imageName}:test --help

  echo "  Testing git binary..."
  docker run --rm --entrypoint git ${image.imageName}:test --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -q "1000"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All forgejo tests passed!"
''
