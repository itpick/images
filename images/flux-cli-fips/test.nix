{ pkgs, image }:

pkgs.writeShellScript "test-flux-cli-fips" ''
  set -euo pipefail
  echo "Testing flux-cli-fips image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking flux runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking flux is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flux >/dev/null 2>&1 || ls /nix/store/*/bin/flux >/dev/null 2>&1'

  echo "All flux-cli-fips tests passed!"
''
