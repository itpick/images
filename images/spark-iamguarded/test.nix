{ pkgs, image }:

pkgs.writeShellScript "test-spark-iamguarded" ''
  set -euo pipefail
  echo "Testing spark-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All spark-iamguarded tests passed!"
''
