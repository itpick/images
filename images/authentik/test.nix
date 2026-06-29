{ pkgs, image }:

pkgs.writeShellScript "test-authentik" ''
  set -euo pipefail
  echo "Testing authentik image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Entry binary present
  echo "  Checking ak is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ak >/dev/null 2>&1 || ls /nix/store/*/bin/ak >/dev/null 2>&1'

  echo "All authentik tests passed!"
''
