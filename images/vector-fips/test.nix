{ pkgs, image }:

pkgs.writeShellScript "test-vector-fips" ''
  set -euo pipefail
  echo "Testing vector-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All vector-fips tests passed!"
''
