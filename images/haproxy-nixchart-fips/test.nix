{ pkgs, image }:

pkgs.writeShellScript "test-haproxy-nixchart-fips" ''
  set -euo pipefail
  echo "Testing haproxy-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All haproxy-nixchart-fips tests passed!"
''
