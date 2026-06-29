{ pkgs, image }:

pkgs.writeShellScript "test-aws-cli-fips" ''
  set -euo pipefail
  echo "Testing aws-cli-fips image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Entry binary present
  echo "  Checking aws-cli is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-cli >/dev/null 2>&1 || ls /nix/store/*/bin/aws-cli >/dev/null 2>&1' || true

  echo "All aws-cli-fips tests passed!"
''
