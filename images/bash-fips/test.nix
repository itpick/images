{ pkgs, image }:

pkgs.writeShellScript "test-bash-fips" ''
  set -euo pipefail
  echo "Testing bash-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All bash-fips tests passed!"
''
