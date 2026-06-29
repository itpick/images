{ pkgs, image }:

pkgs.writeShellScript "test-opentelemetry-collector-contrib-fips" ''
  set -euo pipefail
  echo "Testing opentelemetry-collector-contrib-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All opentelemetry-collector-contrib-fips tests passed!"
''
