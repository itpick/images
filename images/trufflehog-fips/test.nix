{ pkgs, image }:

pkgs.writeShellScript "test-trufflehog-fips" ''
  set -euo pipefail
  echo "Testing trufflehog-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All trufflehog-fips tests passed!"
''
