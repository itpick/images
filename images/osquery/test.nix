{ pkgs, image }:

pkgs.writeShellScript "test-osquery" ''
  set -euo pipefail
  echo "Testing osquery image..."

  # 1. osqueryi reports its version (exit 0, non-empty output)
  echo "  Checking osqueryi --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. osqueryi binary present in image
  echo "  Checking osqueryi binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v osqueryi >/dev/null 2>&1 || ls /nix/store/*/bin/osqueryi >/dev/null 2>&1'

  echo "All osquery tests passed!"
''
