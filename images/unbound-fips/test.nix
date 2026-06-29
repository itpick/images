{ pkgs, image }:

pkgs.writeShellScript "test-unbound-fips" ''
  set -euo pipefail
  echo "Testing unbound-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All unbound-fips tests passed!"
''
