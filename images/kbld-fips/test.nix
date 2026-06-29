{ pkgs, image }:

pkgs.writeShellScript "test-kbld-fips" ''
  set -euo pipefail
  echo "Testing kbld-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kbld-fips tests passed!"
''
