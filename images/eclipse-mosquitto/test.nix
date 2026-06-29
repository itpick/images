{ pkgs, image }:

pkgs.writeShellScript "test-eclipse-mosquitto" ''
  set -euo pipefail
  echo "Testing eclipse-mosquitto image..."

  # mosquitto's default Cmd starts a long-running broker, so we don't run it
  # directly. Conservatively verify the broker binary is present and the image
  # has a working shell + filesystem.
  echo "  Checking mosquitto is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mosquitto >/dev/null 2>&1 || ls /nix/store/*/bin/mosquitto >/dev/null 2>&1'

  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All eclipse-mosquitto tests passed!"
''
