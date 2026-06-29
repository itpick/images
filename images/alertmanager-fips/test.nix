{ pkgs, image }:

pkgs.writeShellScript "test-alertmanager-fips" ''
  set -euo pipefail
  echo "Testing alertmanager-fips image..."

  # 1. Entry binary runs help and prints non-empty output
  echo "  Checking alertmanager runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking alertmanager is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v alertmanager >/dev/null 2>&1 || ls /nix/store/*/bin/alertmanager >/dev/null 2>&1'

  echo "All alertmanager-fips tests passed!"
''
