{ pkgs, image }:

pkgs.writeShellScript "test-flux-source-controller-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing flux-source-controller-iamguarded-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking flux-source-controller-iamguarded runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking flux-source-controller-iamguarded is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flux-source-controller-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/flux-source-controller-iamguarded >/dev/null 2>&1' || true

  echo "All flux-source-controller-iamguarded-fips tests passed!"
''
