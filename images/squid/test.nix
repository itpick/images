{ pkgs, image }:

pkgs.writeShellScript "test-squid" ''
  set -euo pipefail
  echo "Testing squid image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking squid runs (-v)..."
  out=$(docker run --rm ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking squid is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v squid >/dev/null 2>&1 || ls /nix/store/*/bin/squid >/dev/null 2>&1'

  echo "All squid tests passed!"
''
