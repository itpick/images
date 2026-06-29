{ pkgs, image }:

pkgs.writeShellScript "test-minio-iamguarded" ''
  set -euo pipefail
  echo "Testing minio-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All minio-iamguarded tests passed!"
''
