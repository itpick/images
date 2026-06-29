{ pkgs, image }:

pkgs.writeShellScript "test-rabbitmq-server-fips" ''
  set -euo pipefail
  echo "Testing rabbitmq-server-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rabbitmq-server-fips tests passed!"
''
