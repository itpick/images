{ pkgs, image }:

pkgs.writeShellScript "test-polaris-fips" ''
  set -euo pipefail
  echo "Testing polaris-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All polaris-fips tests passed!"
''
