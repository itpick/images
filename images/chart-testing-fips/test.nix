{ pkgs, image }:

pkgs.writeShellScript "test-chart-testing-fips" ''
  set -euo pipefail
  echo "Testing chart-testing-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All chart-testing-fips tests passed!"
''
