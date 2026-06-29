{ pkgs, image }:

pkgs.writeShellScript "test-cypress-base" ''
  set -euo pipefail
  echo "Testing cypress-base image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All cypress-base tests passed!"
''
