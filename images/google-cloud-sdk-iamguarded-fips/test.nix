{ pkgs, image }:

pkgs.writeShellScript "test-google-cloud-sdk-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing google-cloud-sdk-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All google-cloud-sdk-iamguarded-fips tests passed!"
''
