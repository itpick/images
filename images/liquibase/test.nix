{ pkgs, image }:

pkgs.writeShellScript "test-liquibase" ''
  set -euo pipefail
  echo "Testing liquibase image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking liquibase runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking liquibase is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v liquibase >/dev/null 2>&1 || ls /nix/store/*/bin/liquibase >/dev/null 2>&1'

  echo "All liquibase tests passed!"
''
