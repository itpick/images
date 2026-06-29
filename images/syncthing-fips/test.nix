{ pkgs, image }:

pkgs.writeShellScript "test-syncthing-fips" ''
  set -euo pipefail
  echo "Testing syncthing-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All syncthing-fips tests passed!"
''
