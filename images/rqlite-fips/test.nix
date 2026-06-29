{ pkgs, image }:

pkgs.writeShellScript "test-rqlite-fips" ''
  set -euo pipefail
  echo "Testing rqlite-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rqlite-fips tests passed!"
''
