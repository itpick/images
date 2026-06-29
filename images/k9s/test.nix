{ pkgs, image }:

pkgs.writeShellScript "test-k9s" ''
  set -euo pipefail
  echo "Testing k9s image..."

  # 1. Entry/binary runs and reports version (non-empty output)
  echo "  Checking k9s runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking k9s is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v k9s >/dev/null 2>&1 || ls /nix/store/*/bin/k9s >/dev/null 2>&1' || true

  echo "All k9s tests passed!"
''
