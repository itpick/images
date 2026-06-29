{ pkgs, image }:

pkgs.writeShellScript "test-starship" ''
  set -euo pipefail
  echo "Testing starship image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking starship runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking starship is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v starship >/dev/null 2>&1 || ls /nix/store/*/bin/starship >/dev/null 2>&1'

  echo "All starship tests passed!"
''
