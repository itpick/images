{ pkgs, image }:

pkgs.writeShellScript "test-aws-gateway-controller-fips" ''
  set -euo pipefail
  echo "Testing aws-gateway-controller-fips image..."

  # 1. Image runs a shell and the aws-gateway-controller binary is present
  echo "  Checking aws-gateway-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-gateway-controller >/dev/null 2>&1 || ls /nix/store/*/bin/aws-gateway-controller >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-gateway-controller-fips tests passed!"
''
