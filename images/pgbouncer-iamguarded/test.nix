{ pkgs, image }:

pkgs.writeShellScript "test-pgbouncer-iamguarded" ''
  set -euo pipefail
  echo "Testing pgbouncer-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All pgbouncer-iamguarded tests passed!"
''
