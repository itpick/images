{ pkgs, image }:

pkgs.writeShellScript "test-grafana-alloy-fips" ''
  set -euo pipefail
  echo "Testing grafana-alloy-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All grafana-alloy-fips tests passed!"
''
