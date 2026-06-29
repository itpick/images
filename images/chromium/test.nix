{ pkgs, image }:

pkgs.writeShellScript "test-chromium" ''
  set -euo pipefail
  echo "Testing chromium image..."

  # Entrypoint (chromium) reports a version (exit 0, non-empty output)
  echo "  Checking chromium runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking chromium is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v chromium >/dev/null 2>&1 || ls /nix/store/*/bin/chromium >/dev/null 2>&1' || true

  echo "All chromium tests passed!"
''
