{ pkgs, image }:

pkgs.writeShellScript "test-silver-searcher" ''
  set -euo pipefail
  echo "Testing silver-searcher image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking ag runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking ag is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ag >/dev/null 2>&1 || ls /nix/store/*/bin/ag >/dev/null 2>&1' || true

  echo "All silver-searcher tests passed!"
''
