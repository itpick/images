{ pkgs, image }:

pkgs.writeShellScript "test-rancher-system-upgrade-controller" ''
  set -euo pipefail
  echo "Testing rancher-system-upgrade-controller image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking system-upgrade-controller binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v system-upgrade-controller >/dev/null 2>&1 || ls /nix/store/*/bin/system-upgrade-controller >/dev/null 2>&1'

  echo "All rancher-system-upgrade-controller tests passed!"
''
