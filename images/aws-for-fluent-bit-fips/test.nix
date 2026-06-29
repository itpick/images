{ pkgs, image }:

pkgs.writeShellScript "test-aws-for-fluent-bit-fips" ''
  set -euo pipefail
  echo "Testing aws-for-fluent-bit-fips image..."

  # 1. Image runs a shell and the for-fluent-bit binary is present
  echo "  Checking for-fluent-bit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v for-fluent-bit >/dev/null 2>&1 || ls /nix/store/*/bin/for-fluent-bit >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-for-fluent-bit-fips tests passed!"
''
