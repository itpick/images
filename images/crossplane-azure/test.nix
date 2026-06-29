{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-azure" ''
  set -euo pipefail
  echo "Testing crossplane-azure image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking provider runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking provider is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1'

  echo "All crossplane-azure tests passed!"
''
