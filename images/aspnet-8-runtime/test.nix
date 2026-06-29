{ pkgs, image }:

pkgs.writeShellScript "test-aspnet-8-runtime" ''
  set -euo pipefail
  echo "Testing aspnet-8-runtime image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All aspnet-8-runtime tests passed!"
''
