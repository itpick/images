{ pkgs, image }:

pkgs.writeShellScript "test-code-server" ''
  set -euo pipefail
  echo "Testing code-server image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking code-server runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking code-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v code-server >/dev/null 2>&1 || ls /nix/store/*/bin/code-server >/dev/null 2>&1'

  echo "All code-server tests passed!"
''
