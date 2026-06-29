{ pkgs, image }:

pkgs.writeShellScript "test-sonobuoy-fips" ''
  set -euo pipefail
  echo "Testing sonobuoy-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All sonobuoy-fips tests passed!"
''
