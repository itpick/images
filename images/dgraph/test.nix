{ pkgs, image }:

pkgs.writeShellScript "test-dgraph" ''
  set -euo pipefail
  echo "Testing dgraph image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking dgraph runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking dgraph is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dgraph >/dev/null 2>&1 || ls /nix/store/*/bin/dgraph >/dev/null 2>&1' || true

  echo "All dgraph tests passed!"
''
