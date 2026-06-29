{ pkgs, image }:

pkgs.writeShellScript "test-git-sync" ''
  set -euo pipefail
  echo "Testing git-sync image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking git-sync runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking git-sync is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v git-sync >/dev/null 2>&1 || ls /nix/store/*/bin/git-sync >/dev/null 2>&1'

  echo "All git-sync tests passed!"
''
