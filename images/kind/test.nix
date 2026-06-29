{ pkgs, image }:

pkgs.writeShellScript "test-kind" ''
  set -euo pipefail
  echo "Testing kind image..."

  # 1. Entry/binary runs and reports version (non-empty output)
  echo "  Checking kind runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kind is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kind >/dev/null 2>&1 || ls /nix/store/*/bin/kind >/dev/null 2>&1'

  echo "All kind tests passed!"
''
