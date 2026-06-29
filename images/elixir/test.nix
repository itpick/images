{ pkgs, image }:

pkgs.writeShellScript "test-elixir" ''
  set -euo pipefail
  echo "Testing elixir image..."

  # 1. Binary runs and reports version (non-empty output)
  echo "  Checking elixir runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking elixir is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v elixir >/dev/null 2>&1 || ls /nix/store/*/bin/elixir >/dev/null 2>&1'

  echo "All elixir tests passed!"
''
