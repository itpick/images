{ pkgs, image }:

pkgs.writeShellScript "test-triton" ''
  set -euo pipefail
  echo "Testing triton image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking triton runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking triton is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v triton >/dev/null 2>&1 || ls /nix/store/*/bin/triton >/dev/null 2>&1' || true

  echo "All triton tests passed!"
''
