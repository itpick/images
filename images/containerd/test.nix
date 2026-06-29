{ pkgs, image }:

pkgs.writeShellScript "test-containerd" ''
  set -euo pipefail
  echo "Testing containerd image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking containerd runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking containerd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v containerd >/dev/null 2>&1 || ls /nix/store/*/bin/containerd >/dev/null 2>&1'

  echo "All containerd tests passed!"
''
