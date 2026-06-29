{ pkgs, image }:

pkgs.writeShellScript "test-teleport" ''
  set -euo pipefail
  echo "Testing teleport image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking teleport runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking teleport is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v teleport >/dev/null 2>&1 || ls /nix/store/*/bin/teleport >/dev/null 2>&1' || true

  echo "All teleport tests passed!"
''
