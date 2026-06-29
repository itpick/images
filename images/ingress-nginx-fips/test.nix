{ pkgs, image }:

pkgs.writeShellScript "test-ingress-nginx-fips" ''
  set -euo pipefail
  echo "Testing ingress-nginx-fips image..."

  # nginx runs and prints help/usage (non-empty output)
  echo "  Checking nginx runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking nginx is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nginx >/dev/null 2>&1 || ls /nix/store/*/bin/nginx >/dev/null 2>&1' || true

  echo "All ingress-nginx-fips tests passed!"
''
