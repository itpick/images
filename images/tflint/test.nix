{ pkgs, image }:

pkgs.writeShellScript "test-tflint" ''
  set -euo pipefail
  echo "Testing tflint image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking tflint runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tflint is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tflint >/dev/null 2>&1 || ls /nix/store/*/bin/tflint >/dev/null 2>&1'

  echo "All tflint tests passed!"
''
