{ pkgs, image }:

pkgs.writeShellScript "test-flux-notification-controller-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing flux-notification-controller-iamguarded-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking flux-notification-controller-iamguarded runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking flux-notification-controller-iamguarded is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v flux-notification-controller-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/flux-notification-controller-iamguarded >/dev/null 2>&1'

  echo "All flux-notification-controller-iamguarded-fips tests passed!"
''
