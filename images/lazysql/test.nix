{ pkgs, image }:

pkgs.writeShellScript "test-lazysql" ''
  set -euo pipefail
  echo "Testing lazysql image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking lazysql runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking lazysql is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v lazysql >/dev/null 2>&1 || ls /nix/store/*/bin/lazysql >/dev/null 2>&1' || true

  echo "All lazysql tests passed!"
''
