{ pkgs, image }:

pkgs.writeShellScript "test-mosh" ''
  set -euo pipefail
  echo "Testing mosh image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mosh runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mosh is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mosh >/dev/null 2>&1 || ls /nix/store/*/bin/mosh >/dev/null 2>&1'

  echo "All mosh tests passed!"
''
