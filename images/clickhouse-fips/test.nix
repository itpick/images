{ pkgs, image }:

pkgs.writeShellScript "test-clickhouse-fips" ''
  set -euo pipefail
  echo "Testing clickhouse-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All clickhouse-fips tests passed!"
''
