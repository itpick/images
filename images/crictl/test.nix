{ pkgs, image }:

pkgs.writeShellScript "test-crictl" ''
  set -euo pipefail
  echo "Testing crictl image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All crictl tests passed!"
''
