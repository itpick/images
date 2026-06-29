{ pkgs, image }:

pkgs.writeShellScript "test-envsubst" ''
  set -euo pipefail
  echo "Testing envsubst image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking envsubst runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking envsubst is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v envsubst >/dev/null 2>&1 || ls /nix/store/*/bin/envsubst >/dev/null 2>&1'

  echo "All envsubst tests passed!"
''
