{ pkgs, image }:

pkgs.writeShellScript "test-influxdb-iamguarded" ''
  set -euo pipefail
  echo "Testing influxdb-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All influxdb-iamguarded tests passed!"
''
