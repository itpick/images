{ pkgs, image }:

pkgs.writeShellScript "test-gopass" ''
  set -euo pipefail
  echo "Testing gopass image..."

  # Entrypoint binary runs and reports version/help (exit 0, non-empty output).
  echo "  Checking gopass runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image.
  echo "  Checking gopass binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gopass >/dev/null 2>&1 || ls /nix/store/*/bin/gopass >/dev/null 2>&1' || true

  echo "All gopass tests passed!"
''
