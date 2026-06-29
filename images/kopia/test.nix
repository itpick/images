{ pkgs, image }:

pkgs.writeShellScript "test-kopia" ''
  set -euo pipefail
  echo "Testing kopia image..."

  # 1. Binary runs version/help and prints non-empty output (exit 0)
  echo "  Checking kopia runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kopia binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v kopia >/dev/null 2>&1 || ls /nix/store/*/bin/kopia >/dev/null 2>&1'

  echo "All kopia tests passed!"
''
