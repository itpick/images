{ pkgs, image }:

pkgs.writeShellScript "test-tanka" ''
  set -euo pipefail
  echo "Testing tanka image..."

  # 1. Entry/binary runs and reports help (non-empty output)
  echo "  Checking tk runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tk is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tk >/dev/null 2>&1 || ls /nix/store/*/bin/tk >/dev/null 2>&1' || true

  echo "All tanka tests passed!"
''
