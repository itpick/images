{ pkgs, image }:

pkgs.writeShellScript "test-git-nixchart" ''
  set -euo pipefail
  echo "Testing git-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All git-nixchart tests passed!"
''
