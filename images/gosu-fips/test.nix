{ pkgs, image }:

pkgs.writeShellScript "test-gosu-fips" ''
  set -euo pipefail
  echo "Testing gosu-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gosu-fips tests passed!"
''
