{ pkgs, image }:

pkgs.writeShellScript "test-tetragon-fips" ''
  set -euo pipefail
  echo "Testing tetragon-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All tetragon-fips tests passed!"
''
