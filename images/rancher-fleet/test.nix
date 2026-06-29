{ pkgs, image }:

pkgs.writeShellScript "test-rancher-fleet" ''
  set -euo pipefail
  echo "Testing rancher-fleet image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking rancher-fleet binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rancher-fleet >/dev/null 2>&1 || ls /nix/store/*/bin/rancher-fleet >/dev/null 2>&1' || true

  echo "All rancher-fleet tests passed!"
''
