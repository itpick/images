{ pkgs, image }:

pkgs.writeShellScript "test-buildah" ''
  set -euo pipefail
  echo "Testing buildah image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking buildah runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking buildah is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v buildah >/dev/null 2>&1 || ls /nix/store/*/bin/buildah >/dev/null 2>&1'

  echo "All buildah tests passed!"
''
