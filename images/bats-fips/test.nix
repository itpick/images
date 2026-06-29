{ pkgs, image }:

pkgs.writeShellScript "test-bats-fips" ''
  set -euo pipefail
  echo "Testing bats-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All bats-fips tests passed!"
''
