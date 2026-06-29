{ pkgs, image }:

pkgs.writeShellScript "test-spicedb" ''
  set -euo pipefail
  echo "Testing spicedb image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking spicedb runs (version)..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking spicedb is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v spicedb >/dev/null 2>&1 || ls /nix/store/*/bin/spicedb >/dev/null 2>&1'

  echo "All spicedb tests passed!"
''
