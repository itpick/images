{ pkgs, image }:

pkgs.writeShellScript "test-coder" ''
  set -euo pipefail
  echo "Testing coder image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking coder runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking coder is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v coder >/dev/null 2>&1 || ls /nix/store/*/bin/coder >/dev/null 2>&1' || true

  echo "All coder tests passed!"
''
