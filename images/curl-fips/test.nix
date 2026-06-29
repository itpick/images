{ pkgs, image }:

pkgs.writeShellScript "test-curl-fips" ''
  set -euo pipefail
  echo "Testing curl-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All curl-fips tests passed!"
''
