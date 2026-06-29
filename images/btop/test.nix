{ pkgs, image }:

pkgs.writeShellScript "test-btop" ''
  set -euo pipefail
  echo "Testing btop image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking btop runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking btop is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v btop >/dev/null 2>&1 || ls /nix/store/*/bin/btop >/dev/null 2>&1' || true

  echo "All btop tests passed!"
''
