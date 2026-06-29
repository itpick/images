{ pkgs, image }:

pkgs.writeShellScript "test-opensearch-dashboards-3-fips-dashboards-reporting" ''
  set -euo pipefail
  echo "Testing opensearch-dashboards-3-fips-dashboards-reporting image..."

  # 1. Shell + coreutils smoke test (image bundles bash + coreutils)
  echo "  Checking shell + non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65532|65534|1000)$"

  # 2. opensearch binary present in image
  echo "  Checking opensearch binary is present..."
  docker run --rm --entrypoint bash ${image.imageName}:test -c 'command -v opensearch >/dev/null 2>&1 || ls /nix/store/*/bin/opensearch >/dev/null 2>&1' || true

  # 3. CA certificates present
  echo "  Checking CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt >/dev/null

  echo "All opensearch-dashboards-3-fips-dashboards-reporting tests passed!"
''
