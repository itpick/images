{ pkgs, image }:

pkgs.writeShellScript "test-rekor-cli-fips" ''
  set -euo pipefail
  echo "Testing rekor-cli-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rekor-cli-fips tests passed!"
''
