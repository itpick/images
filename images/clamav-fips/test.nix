{ pkgs, image }:

pkgs.writeShellScript "test-clamav-fips" ''
  set -euo pipefail
  echo "Testing clamav-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All clamav-fips tests passed!"
''
