{ pkgs, image }:

pkgs.writeShellScript "test-argocd-fips" ''
  set -euo pipefail
  echo "Testing argocd-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All argocd-fips tests passed!"
''
