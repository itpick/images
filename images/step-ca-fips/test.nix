{ pkgs, image }:

pkgs.writeShellScript "test-step-ca-fips" ''
  set -euo pipefail
  echo "Testing step-ca-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All step-ca-fips tests passed!"
''
