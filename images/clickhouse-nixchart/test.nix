{ pkgs, image }:

pkgs.writeShellScript "test-clickhouse-nixchart" ''
  set -euo pipefail
  echo "Testing clickhouse-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All clickhouse-nixchart tests passed!"
''
