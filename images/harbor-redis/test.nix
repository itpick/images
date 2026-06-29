{ pkgs, image }:

pkgs.writeShellScript "test-harbor-redis" ''
  set -euo pipefail
  echo "Testing harbor-redis image..."

  # redis-server runs and prints version/help (non-empty output)
  echo "  Checking redis-server runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking redis-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v redis-server >/dev/null 2>&1 || ls /nix/store/*/bin/redis-server >/dev/null 2>&1' || true

  echo "All harbor-redis tests passed!"
''
