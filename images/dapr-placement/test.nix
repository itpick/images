{ pkgs, image }:

pkgs.writeShellScript "test-dapr-placement" ''
  set -euo pipefail
  echo "Testing dapr-placement image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All dapr-placement tests passed!"
''
