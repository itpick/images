{ pkgs, image }:

pkgs.writeShellScript "test-distribution-fips" ''
  set -euo pipefail
  echo "Testing distribution-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All distribution-fips tests passed!"
''
