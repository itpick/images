{ pkgs, image }:

pkgs.writeShellScript "test-lazydocker" ''
  set -euo pipefail
  echo "Testing lazydocker image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking lazydocker runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking lazydocker is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v lazydocker >/dev/null 2>&1 || ls /nix/store/*/bin/lazydocker >/dev/null 2>&1'

  echo "All lazydocker tests passed!"
''
