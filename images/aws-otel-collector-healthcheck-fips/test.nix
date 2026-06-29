{ pkgs, image }:

pkgs.writeShellScript "test-aws-otel-collector-healthcheck-fips" ''
  set -euo pipefail
  echo "Testing aws-otel-collector-healthcheck-fips image..."

  # 1. Image runs a shell and the otel-collector-healthcheck binary is present
  echo "  Checking otel-collector-healthcheck is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v otel-collector-healthcheck >/dev/null 2>&1 || ls /nix/store/*/bin/otel-collector-healthcheck >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-otel-collector-healthcheck-fips tests passed!"
''
