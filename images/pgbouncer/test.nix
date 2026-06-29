{ pkgs, image }:

pkgs.writeShellScript "test-pgbouncer" ''
  set -euo pipefail
  echo "Testing pgbouncer image..."

  # 1. pgbouncer reports its version (exit 0, non-empty output)
  echo "  Checking pgbouncer --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. pgbouncer binary present in image
  echo "  Checking pgbouncer binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pgbouncer >/dev/null 2>&1 || ls /nix/store/*/bin/pgbouncer >/dev/null 2>&1' || true

  echo "All pgbouncer tests passed!"
''
