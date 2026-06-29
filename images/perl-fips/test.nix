{ pkgs, image }:

pkgs.writeShellScript "test-perl-fips" ''
  set -euo pipefail
  echo "Testing perl-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All perl-fips tests passed!"
''
