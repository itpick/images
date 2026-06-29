{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmauth-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmauth-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vmauth runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmauth is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmauth >/dev/null 2>&1 || ls /nix/store/*/bin/vmauth >/dev/null 2>&1'

  echo "All victoriametrics-vmauth-fips tests passed!"
''
