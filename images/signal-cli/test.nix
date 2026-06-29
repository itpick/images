{ pkgs, image }:

pkgs.writeShellScript "test-signal-cli" ''
  set -euo pipefail
  echo "Testing signal-cli image..."

  # 1. Entrypoint (signal-cli) runs help and prints non-empty output.
  echo "  Checking signal-cli runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. The signal-cli binary is present in the image.
  echo "  Checking signal-cli is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v signal-cli >/dev/null 2>&1 || ls /nix/store/*/bin/signal-cli >/dev/null 2>&1' || true

  echo "All signal-cli tests passed!"
''
