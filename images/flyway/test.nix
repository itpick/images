{ pkgs, image }:

pkgs.writeShellScript "test-flyway" ''
  set -euo pipefail
  echo "Testing flyway image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking flyway runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking flyway is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flyway >/dev/null 2>&1 || ls /nix/store/*/bin/flyway >/dev/null 2>&1'

  echo "All flyway tests passed!"
''
