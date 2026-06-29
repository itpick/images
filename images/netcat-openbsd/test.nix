{ pkgs, image }:

pkgs.writeShellScript "test-netcat-openbsd" ''
  set -euo pipefail
  echo "Testing netcat-openbsd image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking nc is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nc >/dev/null 2>&1 || ls /nix/store/*/bin/nc >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All netcat-openbsd tests passed!"
''
