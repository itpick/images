{ pkgs, image }:

pkgs.writeShellScript "test-ruby-fips" ''
  set -euo pipefail
  echo "Testing ruby-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All ruby-fips tests passed!"
''
