{ pkgs, image }:

pkgs.writeShellScript "test-bat" ''
  set -euo pipefail
  echo "Testing bat image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking bat runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking bat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v bat >/dev/null 2>&1 || ls /nix/store/*/bin/bat >/dev/null 2>&1'

  echo "All bat tests passed!"
''
