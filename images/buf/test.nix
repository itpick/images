{ pkgs, image }:

pkgs.writeShellScript "test-buf" ''
  set -euo pipefail
  echo "Testing buf image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking buf runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking buf is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v buf >/dev/null 2>&1 || ls /nix/store/*/bin/buf >/dev/null 2>&1'

  echo "All buf tests passed!"
''
