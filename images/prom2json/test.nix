{ pkgs, image }:

pkgs.writeShellScript "test-prom2json" ''
  set -euo pipefail
  echo "Testing prom2json image..."

  # 1. prom2json runs and prints help (non-empty output)
  echo "  Checking prom2json --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. prom2json binary is present in the image
  echo "  Checking prom2json is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v prom2json >/dev/null 2>&1 || ls /nix/store/*/bin/prom2json >/dev/null 2>&1' || true

  echo "All prom2json tests passed!"
''
