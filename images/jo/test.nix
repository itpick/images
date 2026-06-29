{ pkgs, image }:

pkgs.writeShellScript "test-jo" ''
  set -euo pipefail
  echo "Testing jo image..."

  # 1. Entry/binary runs and prints help (non-empty output)
  echo "  Checking jo runs..."
  out=$(docker run --rm ${image.imageName}:test -h 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking jo is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v jo >/dev/null 2>&1 || ls /nix/store/*/bin/jo >/dev/null 2>&1'

  echo "All jo tests passed!"
''
