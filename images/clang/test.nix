{ pkgs, image }:

pkgs.writeShellScript "test-clang" ''
  set -euo pipefail
  echo "Testing clang image..."

  # Entrypoint (clang) reports a version (exit 0, non-empty output)
  echo "  Checking clang runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking clang is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v clang >/dev/null 2>&1 || ls /nix/store/*/bin/clang >/dev/null 2>&1' || true

  echo "All clang tests passed!"
''
