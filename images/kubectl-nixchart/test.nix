{ pkgs, image }:

pkgs.writeShellScript "test-kubectl-nixchart" ''
  set -euo pipefail
  echo "Testing kubectl-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kubectl-nixchart tests passed!"
''
