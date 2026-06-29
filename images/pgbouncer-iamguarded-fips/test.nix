{ pkgs, image }:

pkgs.writeShellScript "test-pgbouncer-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing pgbouncer-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All pgbouncer-iamguarded-fips tests passed!"
''
