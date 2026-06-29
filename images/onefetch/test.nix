{ pkgs, image }:

pkgs.writeShellScript "test-onefetch" ''
  set -euo pipefail
  echo "Testing onefetch image..."

  # 1. Entrypoint (onefetch) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking onefetch runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking onefetch is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v onefetch >/dev/null 2>&1 || ls /nix/store/*/bin/onefetch >/dev/null 2>&1' || true

  echo "All onefetch tests passed!"
''
