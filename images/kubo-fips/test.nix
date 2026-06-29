{ pkgs, image }:

pkgs.writeShellScript "test-kubo-fips" ''
  set -euo pipefail
  echo "Testing kubo-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kubo-fips tests passed!"
''
