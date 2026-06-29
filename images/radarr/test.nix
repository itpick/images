{ pkgs, image }:

pkgs.writeShellScript "test-radarr" ''
  set -euo pipefail
  echo "Testing radarr image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking Radarr binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v Radarr >/dev/null 2>&1 || ls /nix/store/*/bin/Radarr >/dev/null 2>&1'

  echo "All radarr tests passed!"
''
