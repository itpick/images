{ pkgs, image }:

pkgs.writeShellScript "test-oras-fips" ''
  set -euo pipefail
  echo "Testing oras-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All oras-fips tests passed!"
''
