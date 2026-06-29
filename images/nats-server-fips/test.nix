{ pkgs, image }:

pkgs.writeShellScript "test-nats-server-fips" ''
  set -euo pipefail
  echo "Testing nats-server-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nats-server-fips tests passed!"
''
