{ pkgs, image }:

pkgs.writeShellScript "test-calico-whisker" ''
  set -euo pipefail
  echo "Testing calico-whisker image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All calico-whisker tests passed!"
''
