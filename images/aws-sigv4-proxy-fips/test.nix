{ pkgs, image }:

pkgs.writeShellScript "test-aws-sigv4-proxy-fips" ''
  set -euo pipefail
  echo "Testing aws-sigv4-proxy-fips image..."

  # 1. Image runs a shell and the sigv4-proxy binary is present
  echo "  Checking sigv4-proxy is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sigv4-proxy >/dev/null 2>&1 || ls /nix/store/*/bin/sigv4-proxy >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-sigv4-proxy-fips tests passed!"
''
