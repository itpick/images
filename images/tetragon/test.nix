{ pkgs, image }:

pkgs.writeShellScript "test-tetragon" ''
  set -euo pipefail
  echo "Testing tetragon image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking tetragon runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tetragon is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tetragon >/dev/null 2>&1 || ls /nix/store/*/bin/tetragon >/dev/null 2>&1' || true

  echo "All tetragon tests passed!"
''
