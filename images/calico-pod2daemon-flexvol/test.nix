{ pkgs, image }:

pkgs.writeShellScript "test-calico-pod2daemon-flexvol" ''
  set -euo pipefail
  echo "Testing calico-pod2daemon-flexvol image..."

  # 1. Image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking flexvol is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flexvol >/dev/null 2>&1 || ls /nix/store/*/bin/flexvol >/dev/null 2>&1'

  echo "All calico-pod2daemon-flexvol tests passed!"
''
