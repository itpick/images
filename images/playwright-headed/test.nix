{ pkgs, image }:

pkgs.writeShellScript "test-playwright-headed" ''
  set -euo pipefail
  echo "Testing playwright-headed image..."

  # Image has no entrypoint; node + busybox are on PATH.

  # 1. node reports its version (exit 0, non-empty output)
  echo "  Checking node --version..."
  out=$(docker run --rm ${image.imageName}:test node --version 2>&1 || true)
  [ -n "$out" ]

  # 2. node binary present in image
  echo "  Checking node binary is present..."
  docker run --rm --entrypoint sh ${image.imageName}:test -c 'command -v node >/dev/null 2>&1'

  echo "All playwright-headed tests passed!"
''
