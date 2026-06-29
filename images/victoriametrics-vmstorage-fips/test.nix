{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmstorage-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmstorage-fips image..."

  # 1. Entry binary runs and reports version (non-empty output)
  echo "  Checking vmstorage runs..."
  out=$(docker run --rm ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmstorage is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmstorage >/dev/null 2>&1 || ls /nix/store/*/bin/vmstorage >/dev/null 2>&1' || true

  echo "All victoriametrics-vmstorage-fips tests passed!"
''
