{ pkgs, image }:

pkgs.writeShellScript "test-openfortivpn" ''
  set -euo pipefail
  echo "Testing openfortivpn image..."

  # 1. Entrypoint (openfortivpn) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking openfortivpn runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking openfortivpn is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v openfortivpn >/dev/null 2>&1 || ls /nix/store/*/bin/openfortivpn >/dev/null 2>&1'

  echo "All openfortivpn tests passed!"
''
