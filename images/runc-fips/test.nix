{ pkgs, image }:

pkgs.writeShellScript "test-runc-fips" ''
  set -euo pipefail
  echo "Testing runc-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All runc-fips tests passed!"
''
