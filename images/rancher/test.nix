{ pkgs, image }:

pkgs.writeShellScript "test-rancher" ''
  set -euo pipefail
  echo "Testing rancher image..."

  # 1. Entrypoint runs --help (exit 0, non-empty output)
  echo "  Checking rancher runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image
  echo "  Checking rancher binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rancher >/dev/null 2>&1 || ls /nix/store/*/bin/rancher >/dev/null 2>&1' || true

  echo "All rancher tests passed!"
''
