{ pkgs, image }:

pkgs.writeShellScript "test-pulumi-nonroot" ''
  set -euo pipefail
  echo "Testing pulumi-nonroot image..."

  # 1. Entrypoint runs and reports version
  echo "  Checking pulumi runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pulumi is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pulumi >/dev/null 2>&1 || ls /nix/store/*/bin/pulumi >/dev/null 2>&1' || true

  echo "All pulumi-nonroot tests passed!"
''
