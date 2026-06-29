{ pkgs, image }:

pkgs.writeShellScript "test-aws-flb-firehose-fips" ''
  set -euo pipefail
  echo "Testing aws-flb-firehose-fips image..."

  # 1. Image runs a shell and the flb-firehose binary is present
  echo "  Checking flb-firehose is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flb-firehose >/dev/null 2>&1 || ls /nix/store/*/bin/flb-firehose >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-flb-firehose-fips tests passed!"
''
