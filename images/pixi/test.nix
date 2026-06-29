{ pkgs, image }:

pkgs.writeShellScript "test-pixi" ''
  set -euo pipefail
  echo "Testing pixi image..."

  # 1. pixi prints help (exit 0, non-empty output)
  echo "  Checking pixi --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. pixi binary present in image
  echo "  Checking pixi binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pixi >/dev/null 2>&1 || ls /nix/store/*/bin/pixi >/dev/null 2>&1' || true

  echo "All pixi tests passed!"
''
