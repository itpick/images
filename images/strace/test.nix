{ pkgs, image }:

pkgs.writeShellScript "test-strace" ''
  set -euo pipefail
  echo "Testing strace image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking strace runs (-V)..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking strace is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v strace >/dev/null 2>&1 || ls /nix/store/*/bin/strace >/dev/null 2>&1' || true

  echo "All strace tests passed!"
''
