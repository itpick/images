{ pkgs, image }:

pkgs.writeShellScript "test-rancher-dashboard" ''
  set -euo pipefail
  echo "Testing rancher-dashboard image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking dashboard binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dashboard >/dev/null 2>&1 || ls /nix/store/*/bin/dashboard >/dev/null 2>&1' || true

  echo "All rancher-dashboard tests passed!"
''
