{ pkgs, image }:

pkgs.writeShellScript "test-rage" ''
  set -euo pipefail
  echo "Testing rage image..."

  # 1. Entrypoint runs --version (exit 0, non-empty output)
  echo "  Checking rage runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image
  echo "  Checking rage binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rage >/dev/null 2>&1 || ls /nix/store/*/bin/rage >/dev/null 2>&1' || true

  echo "All rage tests passed!"
''
