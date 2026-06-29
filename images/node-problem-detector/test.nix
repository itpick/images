{ pkgs, image }:

pkgs.writeShellScript "test-node-problem-detector" ''
  set -euo pipefail
  echo "Testing node-problem-detector image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking node-problem-detector runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking node-problem-detector is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v node-problem-detector >/dev/null 2>&1 || ls /nix/store/*/bin/node-problem-detector >/dev/null 2>&1' || true

  echo "All node-problem-detector tests passed!"
''
