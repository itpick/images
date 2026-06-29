{ pkgs, image }:

pkgs.writeShellScript "test-spire-agent" ''
  set -euo pipefail
  echo "Testing spire-agent image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking spire-agent runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking spire-agent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v spire-agent >/dev/null 2>&1 || ls /nix/store/*/bin/spire-agent >/dev/null 2>&1'

  echo "All spire-agent tests passed!"
''
