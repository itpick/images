{ pkgs, image }:

pkgs.writeShellScript "test-forgejo-runner" ''
  set -euo pipefail
  echo "Testing forgejo-runner image..."

  echo "  Testing act_runner --help..."
  docker run --rm --entrypoint act_runner ${image.imageName}:test --help

  echo "  Testing git binary..."
  docker run --rm --entrypoint git ${image.imageName}:test --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All forgejo-runner tests passed!"
''
