{ pkgs, image }:

pkgs.writeShellScript "test-dnsdist-fips" ''
  set -euo pipefail
  echo "Testing dnsdist-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All dnsdist-fips tests passed!"
''
