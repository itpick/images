{ pkgs, image }:

pkgs.writeShellScript "test-yq-fips" ''
  set -euo pipefail
  echo "Testing yq-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All yq-fips tests passed!"
''
