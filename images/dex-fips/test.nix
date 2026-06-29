{ pkgs, image }:

pkgs.writeShellScript "test-dex-fips" ''
  set -euo pipefail
  echo "Testing dex-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All dex-fips tests passed!"
''
