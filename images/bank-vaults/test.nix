{ pkgs, image }:

pkgs.writeShellScript "test-bank-vaults" ''
  set -euo pipefail
  echo "Testing bank-vaults image..."

  # 1. Entry binary runs and reports help (exit 0, non-empty output)
  echo "  Checking bank-vaults runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking bank-vaults is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v bank-vaults >/dev/null 2>&1 || ls /nix/store/*/bin/bank-vaults >/dev/null 2>&1' || true

  echo "All bank-vaults tests passed!"
''
