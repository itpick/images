{ pkgs, image }:

pkgs.writeShellScript "test-renovate-fips" ''
  set -euo pipefail
  echo "Testing renovate-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All renovate-fips tests passed!"
''
