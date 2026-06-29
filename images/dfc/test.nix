{ pkgs, image }:

pkgs.writeShellScript "test-dfc" ''
  set -euo pipefail
  echo "Testing dfc image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking dfc runs (-h)..."
  out=$(docker run --rm ${image.imageName}:test -h 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking dfc is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dfc >/dev/null 2>&1 || ls /nix/store/*/bin/dfc >/dev/null 2>&1'

  echo "All dfc tests passed!"
''
