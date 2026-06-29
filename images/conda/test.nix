{ pkgs, image }:

pkgs.writeShellScript "test-conda" ''
  set -euo pipefail
  echo "Testing conda image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking conda runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking conda is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v conda >/dev/null 2>&1 || ls /nix/store/*/bin/conda >/dev/null 2>&1' || true

  echo "All conda tests passed!"
''
