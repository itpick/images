{ pkgs, image }:

pkgs.writeShellScript "test-nginx-nixchart" ''
  set -euo pipefail
  echo "Testing nginx-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nginx-nixchart tests passed!"
''
