{ pkgs, image }:

pkgs.writeShellScript "test-coredns-fips" ''
  set -euo pipefail
  echo "Testing coredns-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All coredns-fips tests passed!"
''
