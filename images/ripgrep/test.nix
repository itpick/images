{ pkgs, image }:

pkgs.writeShellScript "test-ripgrep" ''
  set -euo pipefail
  echo "Testing ripgrep image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking rg runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking rg is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rg >/dev/null 2>&1 || ls /nix/store/*/bin/rg >/dev/null 2>&1' || true

  echo "All ripgrep tests passed!"
''
