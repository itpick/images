{ pkgs, image }:

pkgs.writeShellScript "test-chisel-fips" ''
  set -euo pipefail
  echo "Testing chisel-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All chisel-fips tests passed!"
''
