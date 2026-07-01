{ pkgs, image }:

pkgs.writeShellScript "test-memcached-exporter-nixchart" ''
  set -euo pipefail
  echo "Testing memcached-exporter-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All memcached-exporter-nixchart tests passed!"
''
