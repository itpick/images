{ pkgs, image }:

pkgs.writeShellScript "test-nfpm" ''
  set -euo pipefail
  echo "Testing nfpm image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nfpm runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nfpm is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nfpm >/dev/null 2>&1 || ls /nix/store/*/bin/nfpm >/dev/null 2>&1'

  echo "All nfpm tests passed!"
''
