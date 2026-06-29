{ pkgs, image }:

pkgs.writeShellScript "test-proxysql" ''
  set -euo pipefail
  echo "Testing proxysql image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking proxysql runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking proxysql is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v proxysql >/dev/null 2>&1 || ls /nix/store/*/bin/proxysql >/dev/null 2>&1'

  echo "All proxysql tests passed!"
''
