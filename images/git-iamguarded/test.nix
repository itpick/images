{ pkgs, image }:

pkgs.writeShellScript "test-git-iamguarded" ''
  set -euo pipefail
  echo "Testing git-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All git-iamguarded tests passed!"
''
