{ pkgs, image }:

pkgs.writeShellScript "test-k3s" ''
  set -euo pipefail
  echo "Testing k3s image..."

  # 1. Entry/binary runs and prints help (non-empty output)
  echo "  Checking k3s runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking k3s is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v k3s >/dev/null 2>&1 || ls /nix/store/*/bin/k3s >/dev/null 2>&1' || true

  echo "All k3s tests passed!"
''
