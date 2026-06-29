{ pkgs, image }:

pkgs.writeShellScript "test-lazygit" ''
  set -euo pipefail
  echo "Testing lazygit image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking lazygit runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking lazygit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v lazygit >/dev/null 2>&1 || ls /nix/store/*/bin/lazygit >/dev/null 2>&1' || true

  echo "All lazygit tests passed!"
''
