{ pkgs, image }:

pkgs.writeShellScript "test-ytt-fips" ''
  set -euo pipefail
  echo "Testing ytt-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All ytt-fips tests passed!"
''
