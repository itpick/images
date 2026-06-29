{ pkgs, image }:

pkgs.writeShellScript "test-kubo" ''
  set -euo pipefail
  echo "Testing kubo image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking ipfs runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking ipfs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ipfs >/dev/null 2>&1 || ls /nix/store/*/bin/ipfs >/dev/null 2>&1'

  echo "All kubo tests passed!"
''
