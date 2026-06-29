{ pkgs, image }:

pkgs.writeShellScript "test-iproute2" ''
  set -euo pipefail
  echo "Testing iproute2 image..."

  # ip runs and prints version/help (non-empty output)
  echo "  Checking ip runs..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking ip is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ip >/dev/null 2>&1 || ls /nix/store/*/bin/ip >/dev/null 2>&1'

  echo "All iproute2 tests passed!"
''
