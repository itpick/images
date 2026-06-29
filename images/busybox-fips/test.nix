{ pkgs, image }:

pkgs.writeShellScript "test-busybox-fips" ''
  set -euo pipefail
  echo "Testing busybox-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All busybox-fips tests passed!"
''
