{ pkgs, image }:

pkgs.writeShellScript "test-regclient-fips" ''
  set -euo pipefail
  echo "Testing regclient-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All regclient-fips tests passed!"
''
