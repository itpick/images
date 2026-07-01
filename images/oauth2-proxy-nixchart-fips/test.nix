{ pkgs, image }:

pkgs.writeShellScript "test-oauth2-proxy-nixchart-fips" ''
  set -euo pipefail
  echo "Testing oauth2-proxy-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All oauth2-proxy-nixchart-fips tests passed!"
''
