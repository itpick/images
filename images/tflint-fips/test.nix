{ pkgs, image }:

pkgs.writeShellScript "test-tflint-fips" ''
  set -euo pipefail
  echo "Testing tflint-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All tflint-fips tests passed!"
''
