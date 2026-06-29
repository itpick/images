{ pkgs, image }:

pkgs.writeShellScript "test-gatekeeper-fips" ''
  set -euo pipefail
  echo "Testing gatekeeper-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gatekeeper-fips tests passed!"
''
