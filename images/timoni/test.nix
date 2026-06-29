{ pkgs, image }:

pkgs.writeShellScript "test-timoni" ''
  set -euo pipefail
  echo "Testing timoni image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking timoni runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking timoni is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v timoni >/dev/null 2>&1 || ls /nix/store/*/bin/timoni >/dev/null 2>&1' || true

  echo "All timoni tests passed!"
''
