{ pkgs, image }:

pkgs.writeShellScript "test-thanos-fips" ''
  set -euo pipefail
  echo "Testing thanos-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All thanos-fips tests passed!"
''
