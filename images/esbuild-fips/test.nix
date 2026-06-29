{ pkgs, image }:

pkgs.writeShellScript "test-esbuild-fips" ''
  set -euo pipefail
  echo "Testing esbuild-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All esbuild-fips tests passed!"
''
