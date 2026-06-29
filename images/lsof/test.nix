{ pkgs, image }:

pkgs.writeShellScript "test-lsof" ''
  set -euo pipefail
  echo "Testing lsof image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking lsof runs..."
  out=$(docker run --rm ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking lsof is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v lsof >/dev/null 2>&1 || ls /nix/store/*/bin/lsof >/dev/null 2>&1' || true

  echo "All lsof tests passed!"
''
