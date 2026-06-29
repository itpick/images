{ pkgs, image }:

pkgs.writeShellScript "test-geoserver" ''
  set -euo pipefail
  echo "Testing geoserver image..."

  # Image runs a shell and root filesystem is readable
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/bash ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All geoserver tests passed!"
''
