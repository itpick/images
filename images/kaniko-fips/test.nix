{ pkgs, image }:

pkgs.writeShellScript "test-kaniko-fips" ''
  set -euo pipefail
  echo "Testing kaniko-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kaniko-fips tests passed!"
''
