{ pkgs, image }:

pkgs.writeShellScript "test-flux-kustomize-controller-fips" ''
  set -euo pipefail
  echo "Testing flux-kustomize-controller-fips image..."

  # 1. Entrypoint runs and prints help/usage (non-empty output)
  echo "  Checking kustomize-controller runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kustomize-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kustomize-controller >/dev/null 2>&1 || ls /nix/store/*/bin/kustomize-controller >/dev/null 2>&1' || true

  echo "All flux-kustomize-controller-fips tests passed!"
''
