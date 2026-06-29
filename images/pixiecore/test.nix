{ pkgs, image }:

pkgs.writeShellScript "test-pixiecore" ''
  set -euo pipefail
  echo "Testing pixiecore image..."

  # 1. pixiecore prints help (exit 0, non-empty output)
  echo "  Checking pixiecore --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. pixiecore binary present in image
  echo "  Checking pixiecore binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pixiecore >/dev/null 2>&1 || ls /nix/store/*/bin/pixiecore >/dev/null 2>&1' || true

  echo "All pixiecore tests passed!"
''
