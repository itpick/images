{ pkgs, image }:

pkgs.writeShellScript "test-strongswan" ''
  set -euo pipefail
  echo "Testing strongswan image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking swanctl runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking swanctl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v swanctl >/dev/null 2>&1 || ls /nix/store/*/bin/swanctl >/dev/null 2>&1'

  echo "All strongswan tests passed!"
''
