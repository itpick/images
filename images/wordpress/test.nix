{ pkgs, image }:

pkgs.writeShellScript "test-wordpress" ''
  set -euo pipefail
  echo "Testing wordpress image..."

  # wordpress is a PHP web application (data/asset image), not a runnable CLI,
  # so we smoke-test that the image has a working shell and root filesystem.
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All wordpress tests passed!"
''
