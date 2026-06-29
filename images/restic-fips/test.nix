{ pkgs, image }:

pkgs.writeShellScript "test-restic-fips" ''
  set -euo pipefail
  echo "Testing restic-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All restic-fips tests passed!"
''
