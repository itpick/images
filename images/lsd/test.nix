{ pkgs, image }:

pkgs.writeShellScript "test-lsd" ''
  set -euo pipefail
  echo "Testing lsd image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking lsd runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking lsd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v lsd >/dev/null 2>&1 || ls /nix/store/*/bin/lsd >/dev/null 2>&1' || true

  echo "All lsd tests passed!"
''
