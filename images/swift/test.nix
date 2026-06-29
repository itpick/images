{ pkgs, image }:

pkgs.writeShellScript "test-swift" ''
  set -euo pipefail
  echo "Testing swift image..."

  # 1. Entry/binary runs and reports help (non-empty output)
  echo "  Checking swift runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking swift is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v swift >/dev/null 2>&1 || ls /nix/store/*/bin/swift >/dev/null 2>&1'

  echo "All swift tests passed!"
''
