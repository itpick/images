{ pkgs, image }:

pkgs.writeShellScript "test-aws-cli-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing aws-cli-iamguarded-fips image..."

  # 1. Image runs a shell and the aws-cli-iamguarded binary is present
  echo "  Checking aws-cli-iamguarded is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-cli-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/aws-cli-iamguarded >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-cli-iamguarded-fips tests passed!"
''
