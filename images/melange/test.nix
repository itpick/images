{ pkgs, image }:

pkgs.writeShellScript "test-melange" ''
  set -euo pipefail
  echo "Testing melange image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking melange runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking melange is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v melange >/dev/null 2>&1 || ls /nix/store/*/bin/melange >/dev/null 2>&1'

  echo "All melange tests passed!"
''
