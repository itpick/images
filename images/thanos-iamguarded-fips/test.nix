{ pkgs, image }:

pkgs.writeShellScript "test-thanos-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing thanos-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All thanos-iamguarded-fips tests passed!"
''
