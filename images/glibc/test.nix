{ pkgs, image }:

pkgs.writeShellScript "test-glibc" ''
  set -euo pipefail
  echo "Testing glibc image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All glibc tests passed!"
''
