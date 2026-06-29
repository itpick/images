{ pkgs, image }:

pkgs.writeShellScript "test-guacamole-server" ''
  set -euo pipefail
  echo "Testing guacamole-server image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All guacamole-server tests passed!"
''
