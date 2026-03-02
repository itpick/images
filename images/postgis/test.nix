{ pkgs, image }:

pkgs.writeShellScript "test-postgis" ''
  set -euo pipefail
  echo "Testing postgis image..."

  echo "  Testing bash exists..."
  docker run --rm --entrypoint bash ${image.imageName}:test --version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All postgis tests passed!"
''
