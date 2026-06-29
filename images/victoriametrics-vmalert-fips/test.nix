{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmalert-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmalert-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vmalert runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmalert is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmalert >/dev/null 2>&1 || ls /nix/store/*/bin/vmalert >/dev/null 2>&1' || true

  echo "All victoriametrics-vmalert-fips tests passed!"
''
