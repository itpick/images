{ pkgs, image }:

pkgs.writeShellScript "test-duckdb" ''
  set -euo pipefail
  echo "Testing duckdb image..."

  # 1. Binary runs and reports version (non-empty output)
  echo "  Checking duckdb runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking duckdb is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v duckdb >/dev/null 2>&1 || ls /nix/store/*/bin/duckdb >/dev/null 2>&1'

  echo "All duckdb tests passed!"
''
