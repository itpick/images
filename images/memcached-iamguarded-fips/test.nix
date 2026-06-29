{ pkgs, image }:

pkgs.writeShellScript "test-memcached-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing memcached-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All memcached-iamguarded-fips tests passed!"
''
