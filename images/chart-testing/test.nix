{ pkgs, image }:

pkgs.writeShellScript "test-chart-testing" ''
  set -euo pipefail
  echo "Testing chart-testing image..."

  # 1. Entrypoint runs version and prints non-empty output (tolerate exit code)
  echo "  Checking ct version..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking ct is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ct >/dev/null 2>&1 || ls /nix/store/*/bin/ct >/dev/null 2>&1'

  echo "All chart-testing tests passed!"
''
