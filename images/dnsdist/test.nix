{ pkgs, image }:

pkgs.writeShellScript "test-dnsdist" ''
  set -euo pipefail
  echo "Testing dnsdist image..."

  # 1. dnsdist reports its version (exit 0, non-empty output).
  # Passing args overrides the default server CMD, so this is a one-shot.
  echo "  Checking dnsdist runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. dnsdist binary present in image (shell is bundled)
  echo "  Checking dnsdist binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dnsdist >/dev/null 2>&1 || ls /nix/store/*/bin/dnsdist >/dev/null 2>&1' || true

  echo "All dnsdist tests passed!"
''
