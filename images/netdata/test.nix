{ pkgs, image }:

pkgs.writeShellScript "test-netdata" ''
  set -euo pipefail
  echo "Testing netdata image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking netdata is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v netdata >/dev/null 2>&1 || ls /nix/store/*/bin/netdata >/dev/null 2>&1'

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All netdata tests passed!"
''
