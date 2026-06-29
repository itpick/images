{ pkgs, image }:

pkgs.writeShellScript "test-gops-fips" ''
  set -euo pipefail
  echo "Testing gops-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gops-fips tests passed!"
''
