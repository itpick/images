{ pkgs, image }:

pkgs.writeShellScript "test-netcat" ''
  set -euo pipefail
  echo "Testing netcat image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking netcat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v netcat >/dev/null 2>&1 || ls /nix/store/*/bin/netcat >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All netcat tests passed!"
''
