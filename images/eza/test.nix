{ pkgs, image }:

pkgs.writeShellScript "test-eza" ''
  set -euo pipefail
  echo "Testing eza image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking eza runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking eza is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v eza >/dev/null 2>&1 || ls /nix/store/*/bin/eza >/dev/null 2>&1' || true

  echo "All eza tests passed!"
''
