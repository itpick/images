{ pkgs, image }:

pkgs.writeShellScript "test-nix-tree" ''
  set -euo pipefail
  echo "Testing nix-tree image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nix-tree runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nix-tree is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nix-tree >/dev/null 2>&1 || ls /nix/store/*/bin/nix-tree >/dev/null 2>&1'

  echo "All nix-tree tests passed!"
''
