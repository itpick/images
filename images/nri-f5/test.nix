{ pkgs, image }:

pkgs.writeShellScript "test-nri-f5" ''
  set -euo pipefail
  echo "Testing nri-f5 image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking f5 is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v f5 >/dev/null 2>&1 || ls /nix/store/*/bin/f5 >/dev/null 2>&1'

  echo "All nri-f5 tests passed!"
''
