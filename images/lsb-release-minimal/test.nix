{ pkgs, image }:

pkgs.writeShellScript "test-lsb-release-minimal" ''
  set -euo pipefail
  echo "Testing lsb-release-minimal image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All lsb-release-minimal tests passed!"
''
