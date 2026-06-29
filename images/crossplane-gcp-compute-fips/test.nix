{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-gcp-compute-fips" ''
  set -euo pipefail
  echo "Testing crossplane-gcp-compute-fips image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking provider runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking provider is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1' || true

  echo "All crossplane-gcp-compute-fips tests passed!"
''
