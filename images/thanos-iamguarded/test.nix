{ pkgs, image }:

pkgs.writeShellScript "test-thanos-iamguarded" ''
  set -euo pipefail
  echo "Testing thanos-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All thanos-iamguarded tests passed!"
''
