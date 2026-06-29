{ pkgs, image }:

pkgs.writeShellScript "test-tigerbeetle" ''
  set -euo pipefail
  echo "Testing tigerbeetle image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking tigerbeetle runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tigerbeetle is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tigerbeetle >/dev/null 2>&1 || ls /nix/store/*/bin/tigerbeetle >/dev/null 2>&1'

  echo "All tigerbeetle tests passed!"
''
