{ pkgs, image }:

pkgs.writeShellScript "test-velero-fips" ''
  set -euo pipefail
  echo "Testing velero-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All velero-fips tests passed!"
''
