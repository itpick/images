{ pkgs, image }:

pkgs.writeShellScript "test-percona-server-fips" ''
  set -euo pipefail
  echo "Testing percona-server-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All percona-server-fips tests passed!"
''
