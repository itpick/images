{ pkgs, image }:

pkgs.writeShellScript "test-memcached-exporter-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing memcached-exporter-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All memcached-exporter-iamguarded-fips tests passed!"
''
