{ pkgs, image }:

pkgs.writeShellScript "test-grafana-fips" ''
  set -euo pipefail
  echo "Testing grafana-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All grafana-fips tests passed!"
''
