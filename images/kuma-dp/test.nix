{ pkgs, image }:

pkgs.writeShellScript "test-kuma-dp" ''
  set -euo pipefail
  echo "Testing kuma-dp image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kuma-dp runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kuma-dp is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kuma-dp >/dev/null 2>&1 || ls /nix/store/*/bin/kuma-dp >/dev/null 2>&1'

  echo "All kuma-dp tests passed!"
''
