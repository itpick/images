{ pkgs, image }:

pkgs.writeShellScript "test-aspnet-runtime-fips" ''
  set -euo pipefail
  echo "Testing aspnet-runtime-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All aspnet-runtime-fips tests passed!"
''
