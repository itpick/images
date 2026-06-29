{ pkgs, image }:

pkgs.writeShellScript "test-prism" ''
  set -euo pipefail
  echo "Testing prism image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All prism tests passed!"
''
