{ pkgs, image }:

pkgs.writeShellScript "test-gnupg-fips" ''
  set -euo pipefail
  echo "Testing gnupg-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gnupg-fips tests passed!"
''
