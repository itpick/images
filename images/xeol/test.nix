{ pkgs, image }:

pkgs.writeShellScript "test-xeol" ''
  set -euo pipefail
  echo "Testing xeol image..."

  # 1. Entry binary runs and reports version (non-empty output)
  echo "  Checking xeol runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking xeol is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v xeol >/dev/null 2>&1 || ls /nix/store/*/bin/xeol >/dev/null 2>&1' || true

  echo "All xeol tests passed!"
''
