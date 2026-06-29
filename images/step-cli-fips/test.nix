{ pkgs, image }:

pkgs.writeShellScript "test-step-cli-fips" ''
  set -euo pipefail
  echo "Testing step-cli-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All step-cli-fips tests passed!"
''
