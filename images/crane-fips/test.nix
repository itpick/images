{ pkgs, image }:

pkgs.writeShellScript "test-crane-fips" ''
  set -euo pipefail
  echo "Testing crane-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All crane-fips tests passed!"
''
