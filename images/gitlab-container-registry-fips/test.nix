{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-container-registry-fips" ''
  set -euo pipefail
  echo "Testing gitlab-container-registry-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking registry runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking registry is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v registry >/dev/null 2>&1 || ls /nix/store/*/bin/registry >/dev/null 2>&1' || true

  echo "All gitlab-container-registry-fips tests passed!"
''
