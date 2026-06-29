{ pkgs, image }:

pkgs.writeShellScript "test-distribution" ''
  set -euo pipefail
  echo "Testing distribution image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking registry runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking registry is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v registry >/dev/null 2>&1 || ls /nix/store/*/bin/registry >/dev/null 2>&1'

  echo "All distribution tests passed!"
''
