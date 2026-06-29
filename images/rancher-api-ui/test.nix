{ pkgs, image }:

pkgs.writeShellScript "test-rancher-api-ui" ''
  set -euo pipefail
  echo "Testing rancher-api-ui image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking api-ui binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v api-ui >/dev/null 2>&1 || ls /nix/store/*/bin/api-ui >/dev/null 2>&1'

  echo "All rancher-api-ui tests passed!"
''
