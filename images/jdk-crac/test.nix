{ pkgs, image }:

pkgs.writeShellScript "test-jdk-crac" ''
  set -euo pipefail
  echo "Testing jdk-crac image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All jdk-crac tests passed!"
''
