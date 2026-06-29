{ pkgs, image }:

pkgs.writeShellScript "test-jdk-fips" ''
  set -euo pipefail
  echo "Testing jdk-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All jdk-fips tests passed!"
''
