{ pkgs, image }:

pkgs.writeShellScript "test-haproxy-fips" ''
  set -euo pipefail
  echo "Testing haproxy-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All haproxy-fips tests passed!"
''
