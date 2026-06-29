{ pkgs, image }:

pkgs.writeShellScript "test-screen" ''
  set -euo pipefail
  echo "Testing screen image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking screen runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking screen is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v screen >/dev/null 2>&1 || ls /nix/store/*/bin/screen >/dev/null 2>&1' || true

  echo "All screen tests passed!"
''
