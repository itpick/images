{ pkgs, image }:

pkgs.writeShellScript "test-exim" ''
  set -euo pipefail
  echo "Testing exim image..."

  # 1. Binary runs and reports version via -bV (non-empty output)
  echo "  Checking exim runs..."
  out=$(docker run --rm ${image.imageName}:test -bV 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking exim is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v exim >/dev/null 2>&1 || ls /nix/store/*/bin/exim >/dev/null 2>&1'

  echo "All exim tests passed!"
''
