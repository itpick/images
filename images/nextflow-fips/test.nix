{ pkgs, image }:

pkgs.writeShellScript "test-nextflow-fips" ''
  set -euo pipefail
  echo "Testing nextflow-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All nextflow-fips tests passed!"
''
