{ pkgs, image }:

pkgs.writeShellScript "test-percona-server" ''
  set -euo pipefail
  echo "Testing percona-server image..."

  # 1. mysqld reports its version (exit 0, non-empty output)
  echo "  Checking mysqld --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. mysqld binary present in image
  echo "  Checking mysqld binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mysqld >/dev/null 2>&1 || ls /nix/store/*/bin/mysqld >/dev/null 2>&1'

  echo "All percona-server tests passed!"
''
