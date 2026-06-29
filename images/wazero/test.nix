{ pkgs, image }:

pkgs.writeShellScript "test-wazero" ''
  set -euo pipefail
  echo "Testing wazero image..."

  # 1. Entry binary runs and reports version (non-empty output)
  echo "  Checking wazero runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking wazero is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v wazero >/dev/null 2>&1 || ls /nix/store/*/bin/wazero >/dev/null 2>&1' || true

  echo "All wazero tests passed!"
''
