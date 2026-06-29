{ pkgs, image }:

pkgs.writeShellScript "test-vitess" ''
  set -euo pipefail
  echo "Testing vitess image..."

  # 1. Entry binary (vtgate) runs and reports help (non-empty output)
  echo "  Checking vtgate runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vtgate is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vtgate >/dev/null 2>&1 || ls /nix/store/*/bin/vtgate >/dev/null 2>&1'

  echo "All vitess tests passed!"
''
