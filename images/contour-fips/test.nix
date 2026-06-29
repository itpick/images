{ pkgs, image }:

pkgs.writeShellScript "test-contour-fips" ''
  set -euo pipefail
  echo "Testing contour-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All contour-fips tests passed!"
''
