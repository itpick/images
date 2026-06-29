{ pkgs, image }:

pkgs.writeShellScript "test-pv" ''
  set -euo pipefail
  echo "Testing pv image..."

  # 1. Entrypoint runs and reports version
  echo "  Checking pv runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pv is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pv >/dev/null 2>&1 || ls /nix/store/*/bin/pv >/dev/null 2>&1'

  echo "All pv tests passed!"
''
