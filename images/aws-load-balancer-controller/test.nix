{ pkgs, image }:

pkgs.writeShellScript "test-aws-load-balancer-controller" ''
  set -euo pipefail
  echo "Testing aws-load-balancer-controller image..."

  # 1. Image runs a shell and the aws-load-balancer-controller binary is present
  echo "  Checking aws-load-balancer-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-load-balancer-controller >/dev/null 2>&1 || ls /nix/store/*/bin/aws-load-balancer-controller >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-load-balancer-controller tests passed!"
''
