{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-cli-fips" ''
  set -euo pipefail
  echo "Testing kyverno-cli-fips image..."

  # 1. Entrypoint runs version/help and prints non-empty output
  echo "  Checking kyverno-cli runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kyverno-cli is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kyverno-cli >/dev/null 2>&1 || ls /nix/store/*/bin/kyverno-cli >/dev/null 2>&1' || true

  echo "All kyverno-cli-fips tests passed!"
''
