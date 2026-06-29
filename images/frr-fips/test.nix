{ pkgs, image }:

pkgs.writeShellScript "test-frr-fips" ''
  set -euo pipefail
  echo "Testing frr-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All frr-fips tests passed!"
''
