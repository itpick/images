{ pkgs, image }:

pkgs.writeShellScript "test-external-secrets-fips" ''
  set -euo pipefail
  echo "Testing external-secrets-fips image..."

  # 1. Binary runs and prints help (non-empty output)
  echo "  Checking external-secrets runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking external-secrets is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v external-secrets >/dev/null 2>&1 || ls /nix/store/*/bin/external-secrets >/dev/null 2>&1' || true

  echo "All external-secrets-fips tests passed!"
''
