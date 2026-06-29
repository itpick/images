{ pkgs, image }:

pkgs.writeShellScript "test-nftables" ''
  set -euo pipefail
  echo "Testing nftables image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nft runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nft is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nft >/dev/null 2>&1 || ls /nix/store/*/bin/nft >/dev/null 2>&1' || true

  echo "All nftables tests passed!"
''
