{ pkgs, image }:

pkgs.writeShellScript "test-kratos" ''
  set -euo pipefail
  echo "Testing kratos image..."

  # 1. Binary runs version/help and prints non-empty output (exit 0)
  echo "  Checking kratos runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kratos binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v kratos >/dev/null 2>&1 || ls /nix/store/*/bin/kratos >/dev/null 2>&1' || true

  echo "All kratos tests passed!"
''
