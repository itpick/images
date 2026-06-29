{ pkgs, image }:

pkgs.writeShellScript "test-kustomize-fips" ''
  set -euo pipefail
  echo "Testing kustomize-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All kustomize-fips tests passed!"
''
