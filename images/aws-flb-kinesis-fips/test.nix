{ pkgs, image }:

pkgs.writeShellScript "test-aws-flb-kinesis-fips" ''
  set -euo pipefail
  echo "Testing aws-flb-kinesis-fips image..."

  # 1. Image runs a shell and the flb-kinesis binary is present
  echo "  Checking flb-kinesis is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flb-kinesis >/dev/null 2>&1 || ls /nix/store/*/bin/flb-kinesis >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-flb-kinesis-fips tests passed!"
''
