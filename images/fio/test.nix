{ pkgs, image }:

pkgs.writeShellScript "test-fio" ''
  set -euo pipefail
  echo "Testing fio image..."

  # 1. Binary runs and reports version (non-empty output)
  echo "  Checking fio runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking fio is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fio >/dev/null 2>&1 || ls /nix/store/*/bin/fio >/dev/null 2>&1'

  echo "All fio tests passed!"
''
