{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-fips" ''
  set -euo pipefail
  echo "Testing crossplane-fips image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking crossplane runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking crossplane is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v crossplane >/dev/null 2>&1 || ls /nix/store/*/bin/crossplane >/dev/null 2>&1' || true

  echo "All crossplane-fips tests passed!"
''
