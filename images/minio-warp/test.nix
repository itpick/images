{ pkgs, image }:

pkgs.writeShellScript "test-minio-warp" ''
  set -euo pipefail
  echo "Testing minio-warp image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking warp runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking warp is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v warp >/dev/null 2>&1 || ls /nix/store/*/bin/warp >/dev/null 2>&1'

  echo "All minio-warp tests passed!"
''
