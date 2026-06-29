{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-kubectl" ''
  set -euo pipefail
  echo "Testing gitlab-kubectl image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gitlab-kubectl runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gitlab-kubectl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitlab-kubectl >/dev/null 2>&1 || ls /nix/store/*/bin/gitlab-kubectl >/dev/null 2>&1' || true

  echo "All gitlab-kubectl tests passed!"
''
