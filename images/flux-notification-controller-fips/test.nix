{ pkgs, image }:

pkgs.writeShellScript "test-flux-notification-controller-fips" ''
  set -euo pipefail
  echo "Testing flux-notification-controller-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking notification-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking notification-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v notification-controller >/dev/null 2>&1 || ls /nix/store/*/bin/notification-controller >/dev/null 2>&1'

  echo "All flux-notification-controller-fips tests passed!"
''
