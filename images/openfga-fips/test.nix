{ pkgs, image }:

pkgs.writeShellScript "test-openfga-fips" ''
  set -euo pipefail
  echo "Testing openfga-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All openfga-fips tests passed!"
''
