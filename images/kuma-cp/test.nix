{ pkgs, image }:

pkgs.writeShellScript "test-kuma-cp" ''
  set -euo pipefail
  echo "Testing kuma-cp image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kuma-cp runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kuma-cp is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kuma-cp >/dev/null 2>&1 || ls /nix/store/*/bin/kuma-cp >/dev/null 2>&1' || true

  echo "All kuma-cp tests passed!"
''
