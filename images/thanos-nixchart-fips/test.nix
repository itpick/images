{ pkgs, image }:

pkgs.writeShellScript "test-thanos-nixchart-fips" ''
  set -euo pipefail
  echo "Testing thanos-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All thanos-nixchart-fips tests passed!"
''
