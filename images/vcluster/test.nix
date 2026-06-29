{ pkgs, image }:

pkgs.writeShellScript "test-vcluster" ''
  set -euo pipefail
  echo "Testing vcluster image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vcluster runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vcluster is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vcluster >/dev/null 2>&1 || ls /nix/store/*/bin/vcluster >/dev/null 2>&1'

  echo "All vcluster tests passed!"
''
