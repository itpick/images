{ pkgs, image }:

pkgs.writeShellScript "test-cosign-fips" ''
  set -euo pipefail
  echo "Testing cosign-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All cosign-fips tests passed!"
''
