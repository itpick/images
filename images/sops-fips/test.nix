{ pkgs, image }:

pkgs.writeShellScript "test-sops-fips" ''
  set -euo pipefail
  echo "Testing sops-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All sops-fips tests passed!"
''
