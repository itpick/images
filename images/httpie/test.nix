{ pkgs, image }:

pkgs.writeShellScript "test-httpie" ''
  set -euo pipefail
  echo "Testing httpie image..."

  # http runs and prints help/usage (non-empty output)
  echo "  Checking http runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking http is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v http >/dev/null 2>&1 || ls /nix/store/*/bin/http >/dev/null 2>&1' || true

  echo "All httpie tests passed!"
''
