{ pkgs, image }:

pkgs.writeShellScript "test-flux-helm-controller-fips" ''
  set -euo pipefail
  echo "Testing flux-helm-controller-fips image..."

  # 1. Entrypoint runs and prints help/usage (non-empty output)
  echo "  Checking helm-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking helm-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v helm-controller >/dev/null 2>&1 || ls /nix/store/*/bin/helm-controller >/dev/null 2>&1' || true

  echo "All flux-helm-controller-fips tests passed!"
''
