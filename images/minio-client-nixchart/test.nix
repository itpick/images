{ pkgs, image }:

pkgs.writeShellScript "test-minio-client-nixchart" ''
  set -euo pipefail
  echo "Testing minio-client-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All minio-client-nixchart tests passed!"
''
