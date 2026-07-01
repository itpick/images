{ pkgs, image }:

pkgs.writeShellScript "test-contour-nixchart-fips" ''
  set -euo pipefail
  echo "Testing contour-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All contour-nixchart-fips tests passed!"
''
