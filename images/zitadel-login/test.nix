{ pkgs, image }:

pkgs.writeShellScript "test-zitadel-login" ''
  set -euo pipefail
  echo "Testing zitadel-login image..."

  echo "  Testing node binary..."
  docker run --rm --entrypoint node ${image.imageName}:test --version

  echo "  Testing app directory exists..."
  docker run --rm --entrypoint ls ${image.imageName}:test /app/apps/login/server.js

  echo "  Testing entrypoint script..."
  docker run --rm --entrypoint ls ${image.imageName}:test /app/entrypoint.sh

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65532|65534)$"

  echo "All zitadel-login tests passed!"
''
