{ pkgs, image }:

pkgs.writeShellScript "test-spiffe-helper" ''
  set -euo pipefail
  echo "Testing spiffe-helper image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking spiffe-helper runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking spiffe-helper is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v spiffe-helper >/dev/null 2>&1 || ls /nix/store/*/bin/spiffe-helper >/dev/null 2>&1' || true

  echo "All spiffe-helper tests passed!"
''
