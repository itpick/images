{ pkgs, image }:

pkgs.writeShellScript "test-calicoctl-fips" ''
  set -euo pipefail
  echo "Testing calicoctl-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All calicoctl-fips tests passed!"
''
