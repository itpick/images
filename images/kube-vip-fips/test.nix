{ pkgs, image }:

pkgs.writeShellScript "test-kube-vip-fips" ''
  set -euo pipefail
  echo "Testing kube-vip-fips image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking vip is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vip >/dev/null 2>&1 || ls /nix/store/*/bin/vip >/dev/null 2>&1'

  echo "All kube-vip-fips tests passed!"
''
