{ pkgs, image }:

pkgs.writeShellScript "test-sonarr" ''
  set -euo pipefail
  echo "Testing sonarr image..."

  # Smoke test: image runs a shell and the Sonarr binary is present.
  echo "  Checking Sonarr is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v Sonarr >/dev/null 2>&1 || ls /nix/store/*/bin/Sonarr >/dev/null 2>&1'

  echo "All sonarr tests passed!"
''
