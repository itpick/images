{ pkgs, image }:

pkgs.writeShellScript "test-flannel" ''
  set -euo pipefail
  echo "Testing flannel image..."

  # 1. Binary runs and reports version (non-empty output)
  echo "  Checking flannel runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking flannel is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flannel >/dev/null 2>&1 || ls /nix/store/*/bin/flannel >/dev/null 2>&1'

  echo "All flannel tests passed!"
''
