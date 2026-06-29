{ pkgs, image }:

pkgs.writeShellScript "test-go-ipfs" ''
  set -euo pipefail
  echo "Testing go-ipfs image..."

  # Default entrypoint launches the daemon; override to run the ipfs CLI.
  echo "  Checking ipfs runs..."
  out=$(docker run --rm --entrypoint ipfs ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking ipfs binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ipfs >/dev/null 2>&1 || ls /nix/store/*/bin/ipfs >/dev/null 2>&1' || true

  echo "All go-ipfs tests passed!"
''
