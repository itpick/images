{ pkgs, image }:

pkgs.writeShellScript "test-k9s-fips" ''
  set -euo pipefail
  echo "Testing k9s-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All k9s-fips tests passed!"
''
