{ pkgs, image }:

pkgs.writeShellScript "test-cockroachdb" ''
  set -euo pipefail
  echo "Testing cockroachdb image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking cockroach runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking cockroach is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cockroach >/dev/null 2>&1 || ls /nix/store/*/bin/cockroach >/dev/null 2>&1'

  echo "All cockroachdb tests passed!"
''
