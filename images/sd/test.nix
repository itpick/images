{ pkgs, image }:

pkgs.writeShellScript "test-sd" ''
  set -euo pipefail
  echo "Testing sd image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking sd runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sd >/dev/null 2>&1 || ls /nix/store/*/bin/sd >/dev/null 2>&1'

  echo "All sd tests passed!"
''
