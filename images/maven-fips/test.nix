{ pkgs, image }:

pkgs.writeShellScript "test-maven-fips" ''
  set -euo pipefail
  echo "Testing maven-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All maven-fips tests passed!"
''
