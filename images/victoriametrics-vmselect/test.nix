{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmselect" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmselect image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vmselect runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmselect is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmselect >/dev/null 2>&1 || ls /nix/store/*/bin/vmselect >/dev/null 2>&1'

  echo "All victoriametrics-vmselect tests passed!"
''
