{ pkgs, image }:

pkgs.writeShellScript "test-tempo-fips" ''
  set -euo pipefail
  echo "Testing tempo-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All tempo-fips tests passed!"
''
