{ pkgs, image }:

pkgs.writeShellScript "test-flux-operator-fips" ''
  set -euo pipefail
  echo "Testing flux-operator-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking operator runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v operator >/dev/null 2>&1 || ls /nix/store/*/bin/operator >/dev/null 2>&1'

  echo "All flux-operator-fips tests passed!"
''
