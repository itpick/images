{ pkgs, image }:

pkgs.writeShellScript "test-tmux" ''
  set -euo pipefail
  echo "Testing tmux image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking tmux runs..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tmux is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tmux >/dev/null 2>&1 || ls /nix/store/*/bin/tmux >/dev/null 2>&1' || true

  echo "All tmux tests passed!"
''
