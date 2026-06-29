{ pkgs, image }:

pkgs.writeShellScript "test-atuin" ''
  set -euo pipefail
  echo "Testing atuin image..."

  # 1. Entry binary runs help and prints non-empty output
  echo "  Checking atuin runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking atuin is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v atuin >/dev/null 2>&1 || ls /nix/store/*/bin/atuin >/dev/null 2>&1'

  echo "All atuin tests passed!"
''
