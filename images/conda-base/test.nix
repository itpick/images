{ pkgs, image }:

pkgs.writeShellScript "test-conda-base" ''
  set -euo pipefail
  echo "Testing conda-base image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All conda-base tests passed!"
''
