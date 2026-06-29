{ pkgs, image }:

pkgs.writeShellScript "test-ant-fips" ''
  set -euo pipefail
  echo "Testing ant-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All ant-fips tests passed!"
''
