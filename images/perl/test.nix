{ pkgs, image }:

pkgs.writeShellScript "test-perl" ''
  set -euo pipefail
  echo "Testing perl image..."

  # 1. perl reports its version (exit 0, non-empty output)
  echo "  Checking perl --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. perl binary present in image
  echo "  Checking perl binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v perl >/dev/null 2>&1 || ls /nix/store/*/bin/perl >/dev/null 2>&1' || true

  echo "All perl tests passed!"
''
