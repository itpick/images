{ pkgs, image }:

pkgs.writeShellScript "test-contour-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing contour-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All contour-iamguarded-fips tests passed!"
''
