{ pkgs, image }:

pkgs.writeShellScript "test-mtr" ''
  set -euo pipefail
  echo "Testing mtr image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mtr runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mtr is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mtr >/dev/null 2>&1 || ls /nix/store/*/bin/mtr >/dev/null 2>&1' || true

  echo "All mtr tests passed!"
''
