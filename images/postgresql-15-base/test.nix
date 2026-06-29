{ pkgs, image }:

pkgs.writeShellScript "test-postgresql-15-base" ''
  set -euo pipefail
  echo "Testing postgresql-15-base image..."

  # 1. postgres reports its version (exit 0, non-empty output)
  echo "  Checking postgres --version..."
  out=$(docker run --rm ${image.imageName}:test postgres --version 2>&1)
  [ -n "$out" ]

  # 2. Non-root user
  echo "  Checking non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65532|65534|1000)$"

  # 3. CA certificates present
  echo "  Checking CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt >/dev/null

  echo "All postgresql-15-base tests passed!"
''
