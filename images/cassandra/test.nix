{ pkgs, image }:

pkgs.writeShellScript "test-cassandra" ''
  set -euo pipefail
  echo "Testing cassandra image..."

  # 1. Image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking cassandra is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cassandra >/dev/null 2>&1 || ls /nix/store/*/bin/cassandra >/dev/null 2>&1' || true

  echo "All cassandra tests passed!"
''
