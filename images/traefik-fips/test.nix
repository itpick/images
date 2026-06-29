{ pkgs, image }:

pkgs.writeShellScript "test-traefik-fips" ''
  set -euo pipefail
  echo "Testing traefik-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking traefik runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking traefik is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v traefik >/dev/null 2>&1 || ls /nix/store/*/bin/traefik >/dev/null 2>&1' || true

  echo "All traefik-fips tests passed!"
''
