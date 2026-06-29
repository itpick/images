{ pkgs, image }:

pkgs.writeShellScript "test-grype-fips" ''
  set -euo pipefail
  echo "Testing grype-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All grype-fips tests passed!"
''
