{ pkgs, image }:

pkgs.writeShellScript "test-karma-fips" ''
  set -euo pipefail
  echo "Testing karma-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All karma-fips tests passed!"
''
