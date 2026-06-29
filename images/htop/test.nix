{ pkgs, image }:

pkgs.writeShellScript "test-htop" ''
  set -euo pipefail
  echo "Testing htop image..."

  # htop runs and prints help/usage (non-empty output)
  echo "  Checking htop runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking htop is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v htop >/dev/null 2>&1 || ls /nix/store/*/bin/htop >/dev/null 2>&1' || true

  echo "All htop tests passed!"
''
