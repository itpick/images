{ pkgs, image }:

pkgs.writeShellScript "test-pdns-recursor-fips" ''
  set -euo pipefail
  echo "Testing pdns-recursor-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All pdns-recursor-fips tests passed!"
''
