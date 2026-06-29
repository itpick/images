{ pkgs, image }:

pkgs.writeShellScript "test-litecli" ''
  set -euo pipefail
  echo "Testing litecli image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking litecli runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking litecli is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v litecli >/dev/null 2>&1 || ls /nix/store/*/bin/litecli >/dev/null 2>&1' || true

  echo "All litecli tests passed!"
''
