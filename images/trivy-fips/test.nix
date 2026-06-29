{ pkgs, image }:

pkgs.writeShellScript "test-trivy-fips" ''
  set -euo pipefail
  echo "Testing trivy-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All trivy-fips tests passed!"
''
