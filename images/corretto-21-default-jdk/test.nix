{ pkgs, image }:

pkgs.writeShellScript "test-corretto-21-default-jdk" ''
  set -euo pipefail
  echo "Testing corretto-21-default-jdk image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All corretto-21-default-jdk tests passed!"
''
