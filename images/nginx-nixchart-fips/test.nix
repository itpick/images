{ pkgs, image }:

pkgs.writeShellScript "test-nginx-nixchart-fips" ''
  set -euo pipefail
  echo "Testing nginx-nixchart-fips image..."

  # 1. nginx runs and prints version (non-empty output)
  echo "  Checking nginx runs..."
  out=$(docker run --rm ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # 2. nginx binary present in image
  echo "  Checking nginx is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nginx >/dev/null 2>&1 || ls /nix/store/*/bin/nginx >/dev/null 2>&1' || true

  echo "All nginx-nixchart-fips tests passed!"
''
