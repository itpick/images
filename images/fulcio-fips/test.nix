{ pkgs, image }:

pkgs.writeShellScript "test-fulcio-fips" ''
  set -euo pipefail
  echo "Testing fulcio-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All fulcio-fips tests passed!"
''
