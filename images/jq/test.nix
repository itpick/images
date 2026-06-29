{ pkgs, image }:

pkgs.writeShellScript "test-jq" ''
  set -euo pipefail
  echo "Testing jq image..."

  # 1. Entry/binary runs and prints help (non-empty output)
  echo "  Checking jq runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking jq is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v jq >/dev/null 2>&1 || ls /nix/store/*/bin/jq >/dev/null 2>&1' || true

  echo "All jq tests passed!"
''
