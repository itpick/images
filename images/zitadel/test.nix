{ pkgs, image }:

pkgs.writeShellScript "test-zitadel" ''
  set -euo pipefail

  echo "Testing zitadel image..."

  echo "  Testing zitadel --help..."
  docker run --rm ${image.imageName}:test zitadel --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All zitadel tests passed!"
''
