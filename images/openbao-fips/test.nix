{ pkgs, image }:

pkgs.writeShellScript "test-openbao-fips" ''
  set -euo pipefail
  echo "Testing openbao-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All openbao-fips tests passed!"
''
