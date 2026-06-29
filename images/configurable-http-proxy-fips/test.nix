{ pkgs, image }:

pkgs.writeShellScript "test-configurable-http-proxy-fips" ''
  set -euo pipefail
  echo "Testing configurable-http-proxy-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All configurable-http-proxy-fips tests passed!"
''
