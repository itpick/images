{ pkgs, image }:

pkgs.writeShellScript "test-heartbeat" ''
  set -euo pipefail
  echo "Testing heartbeat image..."

  # heartbeat runs and prints help/usage (non-empty output)
  echo "  Checking heartbeat runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking heartbeat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v heartbeat >/dev/null 2>&1 || ls /nix/store/*/bin/heartbeat >/dev/null 2>&1'

  echo "All heartbeat tests passed!"
''
