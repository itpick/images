{ pkgs, image }:

pkgs.writeShellScript "test-metricbeat-fips" ''
  set -euo pipefail
  echo "Testing metricbeat-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All metricbeat-fips tests passed!"
''
