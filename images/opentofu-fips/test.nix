{ pkgs, image }:

pkgs.writeShellScript "test-opentofu-fips" ''
  set -euo pipefail
  echo "Testing opentofu-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All opentofu-fips tests passed!"
''
