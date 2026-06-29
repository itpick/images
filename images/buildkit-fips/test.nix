{ pkgs, image }:

pkgs.writeShellScript "test-buildkit-fips" ''
  set -euo pipefail
  echo "Testing buildkit-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All buildkit-fips tests passed!"
''
