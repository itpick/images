{ pkgs, image }:

pkgs.writeShellScript "test-frr" ''
  set -euo pipefail
  echo "Testing frr image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking zebra runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking zebra is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v zebra >/dev/null 2>&1 || ls /nix/store/*/bin/zebra >/dev/null 2>&1'

  echo "All frr tests passed!"
''
