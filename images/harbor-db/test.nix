{ pkgs, image }:

pkgs.writeShellScript "test-harbor-db" ''
  set -euo pipefail
  echo "Testing harbor-db image..."

  # postgres runs and prints version/help (non-empty output)
  echo "  Checking postgres runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking postgres is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v postgres >/dev/null 2>&1 || ls /nix/store/*/bin/postgres >/dev/null 2>&1'

  echo "All harbor-db tests passed!"
''
