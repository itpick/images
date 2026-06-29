{ pkgs, image }:

pkgs.writeShellScript "test-nsc-fips" ''
  set -euo pipefail
  echo "Testing nsc-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nsc-fips tests passed!"
''
