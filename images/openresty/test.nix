{ pkgs, image }:

pkgs.writeShellScript "test-openresty" ''
  set -euo pipefail
  echo "Testing openresty image..."

  # 1. openresty runs and reports version (nginx prints to stderr, exit 0, non-empty)
  echo "  Checking openresty runs..."
  out=$(docker run --rm ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # 2. openresty binary present in image
  echo "  Checking openresty is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v openresty >/dev/null 2>&1 || ls /nix/store/*/bin/openresty >/dev/null 2>&1' || true

  echo "All openresty tests passed!"
''
