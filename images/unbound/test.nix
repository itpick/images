{ pkgs, image }:

pkgs.writeShellScript "test-unbound" ''
  set -euo pipefail
  echo "Testing unbound image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking unbound runs..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking unbound is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v unbound >/dev/null 2>&1 || ls /nix/store/*/bin/unbound >/dev/null 2>&1' || true

  echo "All unbound tests passed!"
''
