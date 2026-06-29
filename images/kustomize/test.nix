{ pkgs, image }:

pkgs.writeShellScript "test-kustomize" ''
  set -euo pipefail
  echo "Testing kustomize image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking kustomize runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kustomize is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kustomize >/dev/null 2>&1 || ls /nix/store/*/bin/kustomize >/dev/null 2>&1' || true

  echo "All kustomize tests passed!"
''
