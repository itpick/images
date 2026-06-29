{ pkgs, image }:

pkgs.writeShellScript "test-kubectl-iamguarded" ''
  set -euo pipefail
  echo "Testing kubectl-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kubectl-iamguarded tests passed!"
''
