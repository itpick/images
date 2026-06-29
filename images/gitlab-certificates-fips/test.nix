{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-certificates-fips" ''
  set -euo pipefail
  echo "Testing gitlab-certificates-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gitlab-certificates runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gitlab-certificates is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitlab-certificates >/dev/null 2>&1 || ls /nix/store/*/bin/gitlab-certificates >/dev/null 2>&1'

  echo "All gitlab-certificates-fips tests passed!"
''
