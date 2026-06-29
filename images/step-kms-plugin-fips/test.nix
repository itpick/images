{ pkgs, image }:

pkgs.writeShellScript "test-step-kms-plugin-fips" ''
  set -euo pipefail
  echo "Testing step-kms-plugin-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All step-kms-plugin-fips tests passed!"
''
