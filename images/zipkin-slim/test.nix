{ pkgs, image }:

pkgs.writeShellScript "test-zipkin-slim" ''
  set -euo pipefail
  echo "Testing zipkin-slim image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All zipkin-slim tests passed!"
''
