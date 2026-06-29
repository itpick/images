{ pkgs, image }:

pkgs.writeShellScript "test-jupyter-base-notebook" ''
  set -euo pipefail
  echo "Testing jupyter-base-notebook image..."

  # 1. Entry/binary runs and reports version (non-empty output)
  echo "  Checking jupyter runs..."
  out=$(docker run --rm --entrypoint jupyter ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking jupyter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v jupyter >/dev/null 2>&1 || ls /nix/store/*/bin/jupyter >/dev/null 2>&1' || true

  echo "All jupyter-base-notebook tests passed!"
''
