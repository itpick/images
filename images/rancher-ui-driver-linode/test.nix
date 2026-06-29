{ pkgs, image }:

pkgs.writeShellScript "test-rancher-ui-driver-linode" ''
  set -euo pipefail
  echo "Testing rancher-ui-driver-linode image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking ui-driver-linode binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ui-driver-linode >/dev/null 2>&1 || ls /nix/store/*/bin/ui-driver-linode >/dev/null 2>&1'

  echo "All rancher-ui-driver-linode tests passed!"
''
