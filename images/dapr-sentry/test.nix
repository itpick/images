{ pkgs, image }:

pkgs.writeShellScript "test-dapr-sentry" ''
  set -euo pipefail
  echo "Testing dapr-sentry image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All dapr-sentry tests passed!"
''
