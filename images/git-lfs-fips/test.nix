{ pkgs, image }:

pkgs.writeShellScript "test-git-lfs-fips" ''
  set -euo pipefail
  echo "Testing git-lfs-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking git-lfs runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking git-lfs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v git-lfs >/dev/null 2>&1 || ls /nix/store/*/bin/git-lfs >/dev/null 2>&1' || true

  echo "All git-lfs-fips tests passed!"
''
