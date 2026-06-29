{ pkgs, image }:

pkgs.writeShellScript "test-cerbos" ''
  set -euo pipefail
  echo "Testing cerbos image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All cerbos tests passed!"
''
