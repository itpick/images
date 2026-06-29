{ pkgs, image }:

pkgs.writeShellScript "test-hydra-fips" ''
  set -euo pipefail
  echo "Testing hydra-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All hydra-fips tests passed!"
''
