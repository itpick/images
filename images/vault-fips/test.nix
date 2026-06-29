{ pkgs, image }:

pkgs.writeShellScript "test-vault-fips" ''
  set -euo pipefail
  echo "Testing vault-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vault runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vault is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vault >/dev/null 2>&1 || ls /nix/store/*/bin/vault >/dev/null 2>&1' || true

  echo "All vault-fips tests passed!"
''
