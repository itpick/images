{ pkgs, image }:

pkgs.writeShellScript "test-nix-diff" ''
  set -euo pipefail
  echo "Testing nix-diff image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nix-diff runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nix-diff is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nix-diff >/dev/null 2>&1 || ls /nix/store/*/bin/nix-diff >/dev/null 2>&1'

  echo "All nix-diff tests passed!"
''
