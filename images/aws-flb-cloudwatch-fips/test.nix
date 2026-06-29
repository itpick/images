{ pkgs, image }:

pkgs.writeShellScript "test-aws-flb-cloudwatch-fips" ''
  set -euo pipefail
  echo "Testing aws-flb-cloudwatch-fips image..."

  # 1. Image runs a shell and the flb-cloudwatch binary is present
  echo "  Checking flb-cloudwatch is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flb-cloudwatch >/dev/null 2>&1 || ls /nix/store/*/bin/flb-cloudwatch >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-flb-cloudwatch-fips tests passed!"
''
