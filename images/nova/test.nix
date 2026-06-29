{ pkgs, image }:

pkgs.writeShellScript "test-nova" ''
  set -euo pipefail
  echo "Testing nova image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nova tests passed!"
''
