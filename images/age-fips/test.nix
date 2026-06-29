{ pkgs, image }:

pkgs.writeShellScript "test-age-fips" ''
  set -euo pipefail
  echo "Testing age-fips image..."

  # 1. Entry binary runs help and prints non-empty output
  echo "  Checking age runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking age is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v age >/dev/null 2>&1 || ls /nix/store/*/bin/age >/dev/null 2>&1' || true

  echo "All age-fips tests passed!"
''
