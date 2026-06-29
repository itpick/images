{ pkgs, image }:

pkgs.writeShellScript "test-dbgate" ''
  set -euo pipefail
  echo "Testing dbgate image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking dbgate is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dbgate >/dev/null 2>&1 || ls /nix/store/*/bin/dbgate >/dev/null 2>&1'

  echo "All dbgate tests passed!"
''
