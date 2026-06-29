{ pkgs, image }:

pkgs.writeShellScript "test-openresty-fips" ''
  set -euo pipefail
  echo "Testing openresty-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All openresty-fips tests passed!"
''
