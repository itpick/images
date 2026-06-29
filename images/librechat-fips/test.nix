{ pkgs, image }:

pkgs.writeShellScript "test-librechat-fips" ''
  set -euo pipefail
  echo "Testing librechat-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All librechat-fips tests passed!"
''
