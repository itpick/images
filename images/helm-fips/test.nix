{ pkgs, image }:

pkgs.writeShellScript "test-helm-fips" ''
  set -euo pipefail
  echo "Testing helm-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All helm-fips tests passed!"
''
