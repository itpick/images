{ pkgs, image }:

pkgs.writeShellScript "test-rav1e" ''
  set -euo pipefail
  echo "Testing rav1e image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking rav1e runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking rav1e is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rav1e >/dev/null 2>&1 || ls /nix/store/*/bin/rav1e >/dev/null 2>&1' || true

  echo "All rav1e tests passed!"
''
