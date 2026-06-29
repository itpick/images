{ pkgs, image }:

pkgs.writeShellScript "test-omnictl" ''
  set -euo pipefail
  echo "Testing omnictl image..."

  # 1. Entrypoint (omnictl) runs and reports version/help (exit 0, non-empty output)
  echo "  Checking omnictl runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking omnictl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v omnictl >/dev/null 2>&1 || ls /nix/store/*/bin/omnictl >/dev/null 2>&1'

  echo "All omnictl tests passed!"
''
