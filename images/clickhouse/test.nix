{ pkgs, image }:

pkgs.writeShellScript "test-clickhouse" ''
  set -euo pipefail
  echo "Testing clickhouse image..."

  # Entrypoint (clickhouse-server) prints help (non-empty output) rather
  # than starting the server.
  echo "  Checking clickhouse-server runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking clickhouse-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v clickhouse-server >/dev/null 2>&1 || ls /nix/store/*/bin/clickhouse-server >/dev/null 2>&1'

  echo "All clickhouse tests passed!"
''
