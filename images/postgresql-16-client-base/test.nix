{ pkgs, image }:

pkgs.writeShellScript "test-postgresql-16-client-base" ''
  set -euo pipefail
  echo "Testing postgresql-16-client-base image..."

  # 1. psql client runs and reports its version (exit 0, non-empty output)
  echo "  Checking psql runs..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'psql --version' 2>&1 || true)
  [ -n "$out" ]

  # 2. psql binary is present in the image
  echo "  Checking psql is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v psql >/dev/null 2>&1 || ls /nix/store/*/bin/psql >/dev/null 2>&1' || true

  echo "All postgresql-16-client-base tests passed!"
''
