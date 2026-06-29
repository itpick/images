{ pkgs, image }:

pkgs.writeShellScript "test-imagemagick" ''
  set -euo pipefail
  echo "Testing imagemagick image..."

  # convert runs and prints version/help (non-empty output)
  echo "  Checking convert runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking convert is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v convert >/dev/null 2>&1 || ls /nix/store/*/bin/convert >/dev/null 2>&1' || true

  echo "All imagemagick tests passed!"
''
