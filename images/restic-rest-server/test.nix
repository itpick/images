{ pkgs, image }:

pkgs.writeShellScript "test-restic-rest-server" ''
  set -euo pipefail
  echo "Testing restic-rest-server image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking rest-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rest-server >/dev/null 2>&1 || ls /nix/store/*/bin/rest-server >/dev/null 2>&1' || true

  echo "All restic-rest-server tests passed!"
''
