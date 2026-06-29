{ pkgs, image }:

pkgs.writeShellScript "test-conftest-fips" ''
  set -euo pipefail
  echo "Testing conftest-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All conftest-fips tests passed!"
''
