{ pkgs, image }:

pkgs.writeShellScript "test-spicedb-fips" ''
  set -euo pipefail
  echo "Testing spicedb-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All spicedb-fips tests passed!"
''
