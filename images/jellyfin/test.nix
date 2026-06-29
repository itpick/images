{ pkgs, image }:

pkgs.writeShellScript "test-jellyfin" ''
  set -euo pipefail
  echo "Testing jellyfin image..."

  # Smoke test: the image starts a shell and the expected binary is present.
  # (jellyfin is a long-running server; we avoid guessing version/help flags and
  #  instead verify the image is usable and the entrypoint binary exists.)
  echo "  Checking shell works and jellyfin is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v jellyfin >/dev/null 2>&1 || ls /nix/store/*/bin/jellyfin >/dev/null 2>&1)'

  echo "All jellyfin tests passed!"
''
