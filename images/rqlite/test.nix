{ pkgs, image }:

pkgs.writeShellScript "test-rqlite" ''
  set -euo pipefail
  echo "Testing rqlite image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking rqlited is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rqlited >/dev/null 2>&1 || ls /nix/store/*/bin/rqlited >/dev/null 2>&1'

  echo "All rqlite tests passed!"
''
