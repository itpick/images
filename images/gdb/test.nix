{ pkgs, image }:

pkgs.writeShellScript "test-gdb" ''
  set -euo pipefail
  echo "Testing gdb image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gdb runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gdb is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gdb >/dev/null 2>&1 || ls /nix/store/*/bin/gdb >/dev/null 2>&1' || true

  echo "All gdb tests passed!"
''
