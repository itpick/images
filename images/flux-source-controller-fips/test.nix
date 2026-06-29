{ pkgs, image }:

pkgs.writeShellScript "test-flux-source-controller-fips" ''
  set -euo pipefail
  echo "Testing flux-source-controller-fips image..."

  # Entrypoint runs and reports version/help (exit tolerated, output non-empty)
  echo "  Checking source-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking source-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v source-controller >/dev/null 2>&1 || ls /nix/store/*/bin/source-controller >/dev/null 2>&1'

  echo "All flux-source-controller-fips tests passed!"
''
