{ pkgs, image }:

pkgs.writeShellScript "test-dart" ''
  set -euo pipefail
  echo "Testing dart image..."

  # 1. Entry binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking dart runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking dart is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dart >/dev/null 2>&1 || ls /nix/store/*/bin/dart >/dev/null 2>&1'

  echo "All dart tests passed!"
''
