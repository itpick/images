{ pkgs, image }:

pkgs.writeShellScript "test-plocate" ''
  set -euo pipefail
  echo "Testing plocate image..."

  # 1. plocate reports its version (exit 0, non-empty output)
  echo "  Checking plocate --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. plocate binary present in image
  echo "  Checking plocate binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v plocate >/dev/null 2>&1 || ls /nix/store/*/bin/plocate >/dev/null 2>&1'

  echo "All plocate tests passed!"
''
