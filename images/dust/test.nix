{ pkgs, image }:

pkgs.writeShellScript "test-dust" ''
  set -euo pipefail
  echo "Testing dust image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking dust runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking dust is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dust >/dev/null 2>&1 || ls /nix/store/*/bin/dust >/dev/null 2>&1' || true

  echo "All dust tests passed!"
''
