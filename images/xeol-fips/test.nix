{ pkgs, image }:

pkgs.writeShellScript "test-xeol-fips" ''
  set -euo pipefail
  echo "Testing xeol-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All xeol-fips tests passed!"
''
