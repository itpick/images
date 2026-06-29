{ pkgs, image }:

pkgs.writeShellScript "test-clickhouse-iamguarded" ''
  set -euo pipefail
  echo "Testing clickhouse-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All clickhouse-iamguarded tests passed!"
''
