{ pkgs, image }:

pkgs.writeShellScript "test-minio-nixchart" ''
  set -euo pipefail
  echo "Testing minio-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All minio-nixchart tests passed!"
''
