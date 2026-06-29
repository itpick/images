{ pkgs, image }:

pkgs.writeShellScript "test-rtorrent" ''
  set -euo pipefail
  echo "Testing rtorrent image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking rtorrent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rtorrent >/dev/null 2>&1 || ls /nix/store/*/bin/rtorrent >/dev/null 2>&1'

  echo "All rtorrent tests passed!"
''
