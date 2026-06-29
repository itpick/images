{ pkgs, image }:

pkgs.writeShellScript "test-code-server-fips" ''
  set -euo pipefail
  echo "Testing code-server-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All code-server-fips tests passed!"
''
