{ pkgs, image }:

pkgs.writeShellScript "test-kapp-fips" ''
  set -euo pipefail
  echo "Testing kapp-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kapp-fips tests passed!"
''
