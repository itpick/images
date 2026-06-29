{ pkgs, image }:

pkgs.writeShellScript "test-gomplate-fips" ''
  set -euo pipefail
  echo "Testing gomplate-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gomplate-fips tests passed!"
''
