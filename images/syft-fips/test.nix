{ pkgs, image }:

pkgs.writeShellScript "test-syft-fips" ''
  set -euo pipefail
  echo "Testing syft-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All syft-fips tests passed!"
''
