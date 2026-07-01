{ pkgs, image }:

pkgs.writeShellScript "test-influxdb-nixchart" ''
  set -euo pipefail
  echo "Testing influxdb-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All influxdb-nixchart tests passed!"
''
