{ pkgs, image }:

pkgs.writeShellScript "test-miller" ''
  set -euo pipefail
  echo "Testing miller image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mlr runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mlr is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mlr >/dev/null 2>&1 || ls /nix/store/*/bin/mlr >/dev/null 2>&1'

  echo "All miller tests passed!"
''
