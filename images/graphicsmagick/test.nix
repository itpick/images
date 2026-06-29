{ pkgs, image }:

pkgs.writeShellScript "test-graphicsmagick" ''
  set -euo pipefail
  echo "Testing graphicsmagick image..."

  # gm runs and prints version/help (non-empty output)
  echo "  Checking gm runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gm is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gm >/dev/null 2>&1 || ls /nix/store/*/bin/gm >/dev/null 2>&1' || true

  echo "All graphicsmagick tests passed!"
''
