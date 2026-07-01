{ pkgs, image }:

pkgs.writeShellScript "test-git-nixchart-fips" ''
  set -euo pipefail
  echo "Testing git-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All git-nixchart-fips tests passed!"
''
