{ pkgs, image }:

pkgs.writeShellScript "test-kubeseal" ''
  set -euo pipefail
  echo "Testing kubeseal image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kubeseal runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kubeseal is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeseal >/dev/null 2>&1 || ls /nix/store/*/bin/kubeseal >/dev/null 2>&1'

  echo "All kubeseal tests passed!"
''
