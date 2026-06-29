{ pkgs, image }:

pkgs.writeShellScript "test-openbao" ''
  set -euo pipefail
  echo "Testing openbao image..."

  # 1. Entrypoint (bao) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking bao runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking bao is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v bao >/dev/null 2>&1 || ls /nix/store/*/bin/bao >/dev/null 2>&1'

  echo "All openbao tests passed!"
''
