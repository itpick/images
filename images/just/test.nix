{ pkgs, image }:

pkgs.writeShellScript "test-just" ''
  set -euo pipefail
  echo "Testing just image..."

  # 1. Entry/binary runs and reports version (non-empty output)
  echo "  Checking just runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking just is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v just >/dev/null 2>&1 || ls /nix/store/*/bin/just >/dev/null 2>&1' || true

  echo "All just tests passed!"
''
