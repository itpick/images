{ pkgs, image }:

pkgs.writeShellScript "test-sealed-secrets" ''
  set -euo pipefail
  echo "Testing sealed-secrets image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking sealed-secrets runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sealed-secrets is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sealed-secrets >/dev/null 2>&1 || ls /nix/store/*/bin/sealed-secrets >/dev/null 2>&1'

  echo "All sealed-secrets tests passed!"
''
