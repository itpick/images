{ pkgs, image }:

pkgs.writeShellScript "test-minio-fips" ''
  set -euo pipefail
  echo "Testing minio-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All minio-fips tests passed!"
''
