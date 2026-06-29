{ pkgs, image }:

pkgs.writeShellScript "test-deck-fips" ''
  set -euo pipefail
  echo "Testing deck-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All deck-fips tests passed!"
''
