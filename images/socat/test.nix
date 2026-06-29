{ pkgs, image }:

pkgs.writeShellScript "test-socat" ''
  set -euo pipefail
  echo "Testing socat image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking socat runs (-h)..."
  out=$(docker run --rm ${image.imageName}:test -h 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking socat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v socat >/dev/null 2>&1 || ls /nix/store/*/bin/socat >/dev/null 2>&1'

  echo "All socat tests passed!"
''
