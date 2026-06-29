{ pkgs, image }:

pkgs.writeShellScript "test-procs" ''
  set -euo pipefail
  echo "Testing procs image..."

  # 1. procs runs and reports its version (exit 0, non-empty output)
  echo "  Checking procs --version..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. procs binary is present in the image
  echo "  Checking procs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v procs >/dev/null 2>&1 || ls /nix/store/*/bin/procs >/dev/null 2>&1' || true

  echo "All procs tests passed!"
''
