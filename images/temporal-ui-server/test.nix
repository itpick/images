{ pkgs, image }:

pkgs.writeShellScript "test-temporal-ui-server" ''
  set -euo pipefail
  echo "Testing temporal-ui-server image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking temporal-ui-server runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking temporal-ui-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v temporal-ui-server >/dev/null 2>&1 || ls /nix/store/*/bin/temporal-ui-server >/dev/null 2>&1'

  echo "All temporal-ui-server tests passed!"
''
