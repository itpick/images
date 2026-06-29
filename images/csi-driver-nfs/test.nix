{ pkgs, image }:

pkgs.writeShellScript "test-csi-driver-nfs" ''
  set -euo pipefail
  echo "Testing csi-driver-nfs image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking csi-driver-nfs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v csi-driver-nfs >/dev/null 2>&1 || ls /nix/store/*/bin/csi-driver-nfs >/dev/null 2>&1'

  echo "All csi-driver-nfs tests passed!"
''
