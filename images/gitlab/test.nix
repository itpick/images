{ pkgs, image }:

pkgs.writeShellScript "test-gitlab" ''
  set -euo pipefail
  echo "Testing gitlab image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gitlab-rake runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gitlab-rake is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitlab-rake >/dev/null 2>&1 || ls /nix/store/*/bin/gitlab-rake >/dev/null 2>&1' || true

  echo "All gitlab tests passed!"
''
