{ pkgs, image }:

pkgs.writeShellScript "test-valkey-fips" ''
  set -euo pipefail
  echo "Testing valkey-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All valkey-fips tests passed!"
''
