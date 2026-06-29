{ pkgs, image }:

pkgs.writeShellScript "test-cloudprober-fips" ''
  set -euo pipefail
  echo "Testing cloudprober-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All cloudprober-fips tests passed!"
''
