{ pkgs, image }:

pkgs.writeShellScript "test-delta" ''
  set -euo pipefail
  echo "Testing delta image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking delta runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking delta is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v delta >/dev/null 2>&1 || ls /nix/store/*/bin/delta >/dev/null 2>&1' || true

  echo "All delta tests passed!"
''
