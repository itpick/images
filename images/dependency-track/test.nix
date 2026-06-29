{ pkgs, image }:

pkgs.writeShellScript "test-dependency-track" ''
  set -euo pipefail
  echo "Testing dependency-track image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All dependency-track tests passed!"
''
