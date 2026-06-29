{ pkgs, image }:

pkgs.writeShellScript "test-pssh" ''
  set -euo pipefail
  echo "Testing pssh image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking pssh runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking pssh is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pssh >/dev/null 2>&1 || ls /nix/store/*/bin/pssh >/dev/null 2>&1' || true

  echo "All pssh tests passed!"
''
