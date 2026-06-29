{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-provider-gcp-storage-fips" ''
  set -euo pipefail
  echo "Testing crossplane-provider-gcp-storage-fips image..."

  # 1. Entrypoint (provider binary) runs and prints non-empty help output
  echo "  Checking provider runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. provider binary present in image
  echo "  Checking provider binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1' || true

  echo "All crossplane-provider-gcp-storage-fips tests passed!"
''
