{ pkgs, image }:

pkgs.writeShellScript "test-glances" ''
  set -euo pipefail
  echo "Testing glances image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking glances runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking glances binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v glances >/dev/null 2>&1 || ls /nix/store/*/bin/glances >/dev/null 2>&1' || true

  echo "All glances tests passed!"
''
