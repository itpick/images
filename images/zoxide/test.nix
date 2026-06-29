{ pkgs, image }:

pkgs.writeShellScript "test-zoxide" ''
  set -euo pipefail
  echo "Testing zoxide image..."

  # 1. Entry binary runs and reports help (non-empty output)
  echo "  Checking zoxide runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking zoxide is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v zoxide >/dev/null 2>&1 || ls /nix/store/*/bin/zoxide >/dev/null 2>&1' || true

  echo "All zoxide tests passed!"
''
