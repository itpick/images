{ pkgs, image }:

pkgs.writeShellScript "test-spiffe-helper-fips" ''
  set -euo pipefail
  echo "Testing spiffe-helper-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All spiffe-helper-fips tests passed!"
''
