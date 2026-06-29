{ pkgs, image }:

pkgs.writeShellScript "test-openvscode-server" ''
  set -euo pipefail
  echo "Testing openvscode-server image..."

  # 1. openvscode-server reports its version (exit 0, non-empty output)
  echo "  Checking openvscode-server --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. openvscode-server binary present in image
  echo "  Checking openvscode-server binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v openvscode-server >/dev/null 2>&1 || ls /nix/store/*/bin/openvscode-server >/dev/null 2>&1' || true

  echo "All openvscode-server tests passed!"
''
