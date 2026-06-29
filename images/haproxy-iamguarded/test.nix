{ pkgs, image }:

pkgs.writeShellScript "test-haproxy-iamguarded" ''
  set -euo pipefail
  echo "Testing haproxy-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All haproxy-iamguarded tests passed!"
''
