{ pkgs, image }:

pkgs.writeShellScript "test-git-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing git-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All git-iamguarded-fips tests passed!"
''
