{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-sql-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-sql-exporter image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking sql_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sql_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sql_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/sql_exporter >/dev/null 2>&1'

  echo "All prometheus-sql-exporter tests passed!"
''
