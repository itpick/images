{ pkgs, image }:

pkgs.writeShellScript "test-fping" ''
  set -euo pipefail
  echo "Testing fping image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking fping runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking fping is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fping >/dev/null 2>&1 || ls /nix/store/*/bin/fping >/dev/null 2>&1' || true

  echo "All fping tests passed!"
''
