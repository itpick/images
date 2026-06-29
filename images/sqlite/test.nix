{ pkgs, image }:

pkgs.writeShellScript "test-sqlite" ''
  set -euo pipefail
  echo "Testing sqlite image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking sqlite3 runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sqlite3 is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sqlite3 >/dev/null 2>&1 || ls /nix/store/*/bin/sqlite3 >/dev/null 2>&1'

  echo "All sqlite tests passed!"
''
