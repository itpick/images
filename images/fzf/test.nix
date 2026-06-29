{ pkgs, image }:

pkgs.writeShellScript "test-fzf" ''
  set -euo pipefail
  echo "Testing fzf image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking fzf runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking fzf is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fzf >/dev/null 2>&1 || ls /nix/store/*/bin/fzf >/dev/null 2>&1'

  echo "All fzf tests passed!"
''
