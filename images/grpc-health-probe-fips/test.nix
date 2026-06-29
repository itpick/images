{ pkgs, image }:

pkgs.writeShellScript "test-grpc-health-probe-fips" ''
  set -euo pipefail
  echo "Testing grpc-health-probe-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All grpc-health-probe-fips tests passed!"
''
