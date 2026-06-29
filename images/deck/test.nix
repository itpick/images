{ pkgs, image }:

pkgs.writeShellScript "test-deck" ''
  set -euo pipefail
  echo "Testing deck image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking deck runs (version)..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking deck is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v deck >/dev/null 2>&1 || ls /nix/store/*/bin/deck >/dev/null 2>&1'

  echo "All deck tests passed!"
''
