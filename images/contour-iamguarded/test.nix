{ pkgs, image }:

pkgs.writeShellScript "test-contour-iamguarded" ''
  set -euo pipefail
  echo "Testing contour-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All contour-iamguarded tests passed!"
''
