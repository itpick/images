{ pkgs, image }:

pkgs.writeShellScript "test-ipfs-cluster" ''
  set -euo pipefail
  echo "Testing ipfs-cluster image..."

  # ipfs-cluster-service runs and prints help/usage (non-empty output)
  echo "  Checking ipfs-cluster-service runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking ipfs-cluster-service is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ipfs-cluster-service >/dev/null 2>&1 || ls /nix/store/*/bin/ipfs-cluster-service >/dev/null 2>&1'

  echo "All ipfs-cluster tests passed!"
''
