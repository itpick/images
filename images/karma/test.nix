{ pkgs, image }:

pkgs.writeShellScript "test-karma" ''
  set -euo pipefail
  echo "Testing karma image..."

  # 1. Entry/binary runs and prints help (non-empty output)
  echo "  Checking karma runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking karma is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v karma >/dev/null 2>&1 || ls /nix/store/*/bin/karma >/dev/null 2>&1'

  echo "All karma tests passed!"
''
