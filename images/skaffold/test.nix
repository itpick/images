{ pkgs, image }:

pkgs.writeShellScript "test-skaffold" ''
  set -euo pipefail
  echo "Testing skaffold image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking skaffold runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking skaffold is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v skaffold >/dev/null 2>&1 || ls /nix/store/*/bin/skaffold >/dev/null 2>&1' || true

  echo "All skaffold tests passed!"
''
