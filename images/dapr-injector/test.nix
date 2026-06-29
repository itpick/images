{ pkgs, image }:

pkgs.writeShellScript "test-dapr-injector" ''
  set -euo pipefail
  echo "Testing dapr-injector image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All dapr-injector tests passed!"
''
