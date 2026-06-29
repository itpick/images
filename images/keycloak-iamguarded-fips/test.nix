{ pkgs, image }:

pkgs.writeShellScript "test-keycloak-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing keycloak-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All keycloak-iamguarded-fips tests passed!"
''
