{ pkgs, image }:

pkgs.writeShellScript "test-asciinema" ''
  set -euo pipefail
  echo "Testing asciinema image..."

  # 1. Entry binary runs help and prints non-empty output
  echo "  Checking asciinema runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking asciinema is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v asciinema >/dev/null 2>&1 || ls /nix/store/*/bin/asciinema >/dev/null 2>&1'

  echo "All asciinema tests passed!"
''
