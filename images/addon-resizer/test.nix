{ pkgs, image }:

pkgs.writeShellScript "test-addon-resizer" ''
  set -euo pipefail
  echo "Testing addon-resizer image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present
  echo "  Checking addon-resizer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v addon-resizer >/dev/null 2>&1 || ls /nix/store/*/bin/addon-resizer >/dev/null 2>&1'

  echo "All addon-resizer tests passed!"
''
