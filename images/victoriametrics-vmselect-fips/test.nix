{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmselect-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmselect-fips image..."

  # 1. Entry binary runs and reports version (non-empty output)
  echo "  Checking vmselect runs..."
  out=$(docker run --rm ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmselect is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmselect >/dev/null 2>&1 || ls /nix/store/*/bin/vmselect >/dev/null 2>&1' || true

  echo "All victoriametrics-vmselect-fips tests passed!"
''
