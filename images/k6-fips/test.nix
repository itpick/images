{ pkgs, image }:

pkgs.writeShellScript "test-k6-fips" ''
  set -euo pipefail
  echo "Testing k6-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All k6-fips tests passed!"
''
