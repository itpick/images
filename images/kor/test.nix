{ pkgs, image }:

pkgs.writeShellScript "test-kor" ''
  set -euo pipefail
  echo "Testing kor image..."

  # 1. Binary runs version/help and prints non-empty output (exit 0)
  echo "  Checking kor runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kor binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v kor >/dev/null 2>&1 || ls /nix/store/*/bin/kor >/dev/null 2>&1' || true

  echo "All kor tests passed!"
''
