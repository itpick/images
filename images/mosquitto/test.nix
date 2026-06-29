{ pkgs, image }:

pkgs.writeShellScript "test-mosquitto" ''
  set -euo pipefail
  echo "Testing mosquitto image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking mosquitto is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mosquitto >/dev/null 2>&1 || ls /nix/store/*/bin/mosquitto >/dev/null 2>&1'

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All mosquitto tests passed!"
''
