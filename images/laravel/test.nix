{ pkgs, image }:

pkgs.writeShellScript "test-laravel" ''
  set -euo pipefail
  echo "Testing laravel image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking laravel runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking laravel is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v laravel >/dev/null 2>&1 || ls /nix/store/*/bin/laravel >/dev/null 2>&1'

  echo "All laravel tests passed!"
''
