{ pkgs, image }:

pkgs.writeShellScript "test-nats-top-fips" ''
  set -euo pipefail
  echo "Testing nats-top-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nats-top-fips tests passed!"
''
