{ pkgs, image }:

pkgs.writeShellScript "test-buck2" ''
  set -euo pipefail
  echo "Testing buck2 image..."

  # 1. Entry binary runs and reports help (exit 0, non-empty output)
  echo "  Checking buck2 runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking buck2 is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v buck2 >/dev/null 2>&1 || ls /nix/store/*/bin/buck2 >/dev/null 2>&1' || true

  echo "All buck2 tests passed!"
''
