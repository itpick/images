{ pkgs, image }:

pkgs.writeShellScript "test-neovim" ''
  set -euo pipefail
  echo "Testing neovim image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking nvim runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nvim is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nvim >/dev/null 2>&1 || ls /nix/store/*/bin/nvim >/dev/null 2>&1'

  echo "All neovim tests passed!"
''
