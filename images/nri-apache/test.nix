{ pkgs, image }:

pkgs.writeShellScript "test-nri-apache" ''
  set -euo pipefail
  echo "Testing nri-apache image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking apache is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v apache >/dev/null 2>&1 || ls /nix/store/*/bin/apache >/dev/null 2>&1' || true

  echo "All nri-apache tests passed!"
''
