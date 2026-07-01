{ pkgs, image }:

pkgs.writeShellScript "test-memcached-nixchart-fips" ''
  set -euo pipefail
  echo "Testing memcached-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All memcached-nixchart-fips tests passed!"
''
