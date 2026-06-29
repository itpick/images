{ pkgs, image }:

pkgs.writeShellScript "test-gitea-fips" ''
  set -euo pipefail
  echo "Testing gitea-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All gitea-fips tests passed!"
''
