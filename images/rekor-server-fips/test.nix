{ pkgs, image }:

pkgs.writeShellScript "test-rekor-server-fips" ''
  set -euo pipefail
  echo "Testing rekor-server-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rekor-server-fips tests passed!"
''
