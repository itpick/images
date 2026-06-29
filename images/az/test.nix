{ pkgs, image }:

pkgs.writeShellScript "test-az" ''
  set -euo pipefail
  echo "Testing az image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking az runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking az is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v az >/dev/null 2>&1 || ls /nix/store/*/bin/az >/dev/null 2>&1'

  echo "All az tests passed!"
''
