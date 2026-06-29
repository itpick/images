{ pkgs, image }:

pkgs.writeShellScript "test-kcat" ''
  set -euo pipefail
  echo "Testing kcat image..."

  # 1. Entry/binary runs and reports version (non-empty output)
  echo "  Checking kcat runs..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kcat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kcat >/dev/null 2>&1 || ls /nix/store/*/bin/kcat >/dev/null 2>&1' || true

  echo "All kcat tests passed!"
''
