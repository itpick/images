{ pkgs, image }:

pkgs.writeShellScript "test-rke2" ''
  set -euo pipefail
  echo "Testing rke2 image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking rke2 runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking rke2 is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rke2 >/dev/null 2>&1 || ls /nix/store/*/bin/rke2 >/dev/null 2>&1'

  echo "All rke2 tests passed!"
''
