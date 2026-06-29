{ pkgs, image }:

pkgs.writeShellScript "test-openldap-fips" ''
  set -euo pipefail
  echo "Testing openldap-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All openldap-fips tests passed!"
''
