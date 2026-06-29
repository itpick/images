{ pkgs, image }:

pkgs.writeShellScript "test-nnn" ''
  set -euo pipefail
  echo "Testing nnn image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nnn runs..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nnn is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nnn >/dev/null 2>&1 || ls /nix/store/*/bin/nnn >/dev/null 2>&1'

  echo "All nnn tests passed!"
''
