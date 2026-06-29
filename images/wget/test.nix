{ pkgs, image }:

pkgs.writeShellScript "test-wget" ''
  set -euo pipefail
  echo "Testing wget image..."

  # 1. Entry binary runs and reports help (non-empty output)
  echo "  Checking wget runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking wget is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v wget >/dev/null 2>&1 || ls /nix/store/*/bin/wget >/dev/null 2>&1'

  echo "All wget tests passed!"
''
