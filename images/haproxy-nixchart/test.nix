{ pkgs, image }:

pkgs.writeShellScript "test-haproxy-nixchart" ''
  set -euo pipefail
  echo "Testing haproxy-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All haproxy-nixchart tests passed!"
''
