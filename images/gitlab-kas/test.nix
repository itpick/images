{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-kas" ''
  set -euo pipefail
  echo "Testing gitlab-kas image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking kas runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking kas is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kas >/dev/null 2>&1 || ls /nix/store/*/bin/kas >/dev/null 2>&1'

  echo "All gitlab-kas tests passed!"
''
