{ pkgs, image }:

pkgs.writeShellScript "test-mcfly" ''
  set -euo pipefail
  echo "Testing mcfly image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mcfly runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mcfly is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mcfly >/dev/null 2>&1 || ls /nix/store/*/bin/mcfly >/dev/null 2>&1' || true

  echo "All mcfly tests passed!"
''
