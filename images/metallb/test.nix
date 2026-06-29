{ pkgs, image }:

pkgs.writeShellScript "test-metallb" ''
  set -euo pipefail
  echo "Testing metallb image..."

  # Conservative smoke test: image runs a shell and root filesystem is present.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All metallb tests passed!"
''
