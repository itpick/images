{ pkgs, image }:

pkgs.writeShellScript "test-calico-typhad" ''
  set -euo pipefail
  echo "Testing calico-typhad image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All calico-typhad tests passed!"
''
