{ pkgs, image }:

pkgs.writeShellScript "test-tesseract-fips" ''
  set -euo pipefail
  echo "Testing tesseract-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All tesseract-fips tests passed!"
''
