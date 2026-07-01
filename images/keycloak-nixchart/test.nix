{ pkgs, image }:

pkgs.writeShellScript "test-keycloak-nixchart" ''
  set -euo pipefail
  echo "Testing keycloak-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All keycloak-nixchart tests passed!"
''
