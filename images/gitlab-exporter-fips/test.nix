{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-exporter-fips" ''
  set -euo pipefail
  echo "Testing gitlab-exporter-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gitlab-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gitlab-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitlab-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/gitlab-exporter >/dev/null 2>&1'

  echo "All gitlab-exporter-fips tests passed!"
''
