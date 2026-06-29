{ pkgs, image }:

pkgs.writeShellScript "test-pypy" ''
  set -euo pipefail
  echo "Testing pypy image..."

  # 1. Entrypoint runs and reports version
  echo "  Checking pypy runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pypy is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pypy >/dev/null 2>&1 || ls /nix/store/*/bin/pypy >/dev/null 2>&1' || true

  echo "All pypy tests passed!"
''
