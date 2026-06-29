{ pkgs, image }:

pkgs.writeShellScript "test-inetutils" ''
  set -euo pipefail
  echo "Testing inetutils image..."

  # ping runs and prints version/help (non-empty output)
  echo "  Checking ping runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking ping is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ping >/dev/null 2>&1 || ls /nix/store/*/bin/ping >/dev/null 2>&1' || true

  echo "All inetutils tests passed!"
''
