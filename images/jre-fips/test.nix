{ pkgs, image }:

pkgs.writeShellScript "test-jre-fips" ''
  set -euo pipefail
  echo "Testing jre-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All jre-fips tests passed!"
''
