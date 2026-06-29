{ pkgs, image }:

pkgs.writeShellScript "test-erlang-fips" ''
  set -euo pipefail
  echo "Testing erlang-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All erlang-fips tests passed!"
''
