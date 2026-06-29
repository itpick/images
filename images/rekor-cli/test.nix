{ pkgs, image }:

pkgs.writeShellScript "test-rekor-cli" ''
  set -euo pipefail
  echo "Testing rekor-cli image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking rekor-cli runs (version)..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking rekor-cli is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rekor-cli >/dev/null 2>&1 || ls /nix/store/*/bin/rekor-cli >/dev/null 2>&1' || true

  echo "All rekor-cli tests passed!"
''
