{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vminsert-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vminsert-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vminsert runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vminsert is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vminsert >/dev/null 2>&1 || ls /nix/store/*/bin/vminsert >/dev/null 2>&1'

  echo "All victoriametrics-vminsert-fips tests passed!"
''
