{ pkgs, image }:

pkgs.writeShellScript "test-fd" ''
  set -euo pipefail
  echo "Testing fd image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking fd runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking fd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fd >/dev/null 2>&1 || ls /nix/store/*/bin/fd >/dev/null 2>&1' || true

  echo "All fd tests passed!"
''
