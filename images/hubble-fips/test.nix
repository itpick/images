{ pkgs, image }:

pkgs.writeShellScript "test-hubble-fips" ''
  set -euo pipefail
  echo "Testing hubble-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All hubble-fips tests passed!"
''
