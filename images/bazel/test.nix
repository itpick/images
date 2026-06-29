{ pkgs, image }:

pkgs.writeShellScript "test-bazel" ''
  set -euo pipefail
  echo "Testing bazel image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output)
  echo "  Checking bazel runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking bazel is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v bazel >/dev/null 2>&1 || ls /nix/store/*/bin/bazel >/dev/null 2>&1'

  echo "All bazel tests passed!"
''
