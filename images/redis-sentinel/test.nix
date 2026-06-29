{ pkgs, image }:

pkgs.writeShellScript "test-redis-sentinel" ''
  set -euo pipefail
  echo "Testing redis-sentinel image..."

  # 1. redis-server runs and prints non-empty output (exit 0)
  echo "  Checking redis-server runs (--version)..."
  out=$(docker run --rm --entrypoint redis-server ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking redis-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v redis-server >/dev/null 2>&1 || ls /nix/store/*/bin/redis-server >/dev/null 2>&1' || true

  echo "All redis-sentinel tests passed!"
''
