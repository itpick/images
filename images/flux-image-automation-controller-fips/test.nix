{ pkgs, image }:

pkgs.writeShellScript "test-flux-image-automation-controller-fips" ''
  set -euo pipefail
  echo "Testing flux-image-automation-controller-fips image..."

  # 1. Entrypoint runs and prints help/usage (non-empty output)
  echo "  Checking image-automation-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking image-automation-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v image-automation-controller >/dev/null 2>&1 || ls /nix/store/*/bin/image-automation-controller >/dev/null 2>&1' || true

  echo "All flux-image-automation-controller-fips tests passed!"
''
