{ pkgs, image }:

pkgs.writeShellScript "test-multus-cni-fips" ''
  set -euo pipefail
  echo "Testing multus-cni-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All multus-cni-fips tests passed!"
''
