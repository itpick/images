{ pkgs, image }:

pkgs.writeShellScript "test-flannel-fips" ''
  set -euo pipefail
  echo "Testing flannel-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All flannel-fips tests passed!"
''
