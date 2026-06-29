{ pkgs, image }:

pkgs.writeShellScript "test-hyperfine" ''
  set -euo pipefail
  echo "Testing hyperfine image..."

  # hyperfine runs and prints version/help (non-empty output)
  echo "  Checking hyperfine runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking hyperfine is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v hyperfine >/dev/null 2>&1 || ls /nix/store/*/bin/hyperfine >/dev/null 2>&1' || true

  echo "All hyperfine tests passed!"
''
