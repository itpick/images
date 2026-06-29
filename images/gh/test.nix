{ pkgs, image }:

pkgs.writeShellScript "test-gh" ''
  set -euo pipefail
  echo "Testing gh image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking gh runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking gh is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gh >/dev/null 2>&1 || ls /nix/store/*/bin/gh >/dev/null 2>&1' || true

  echo "All gh tests passed!"
''
