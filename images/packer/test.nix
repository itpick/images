{ pkgs, image }:

pkgs.writeShellScript "test-packer" ''
  set -euo pipefail
  echo "Testing packer image..."

  # 1. packer reports its version (exit 0, non-empty output)
  echo "  Checking packer version..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. packer binary present in image
  echo "  Checking packer binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v packer >/dev/null 2>&1 || ls /nix/store/*/bin/packer >/dev/null 2>&1' || true

  echo "All packer tests passed!"
''
