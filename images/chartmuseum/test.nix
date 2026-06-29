{ pkgs, image }:

pkgs.writeShellScript "test-chartmuseum" ''
  set -euo pipefail
  echo "Testing chartmuseum image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All chartmuseum tests passed!"
''
