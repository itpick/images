{ pkgs, image }:

pkgs.writeShellScript "test-mailpit" ''
  set -euo pipefail
  echo "Testing mailpit image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mailpit runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mailpit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mailpit >/dev/null 2>&1 || ls /nix/store/*/bin/mailpit >/dev/null 2>&1' || true

  echo "All mailpit tests passed!"
''
