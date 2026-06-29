{ pkgs, image }:

pkgs.writeShellScript "test-livenessprobe" ''
  set -euo pipefail
  echo "Testing livenessprobe image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking csi-livenessprobe is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v csi-livenessprobe >/dev/null 2>&1 || ls /nix/store/*/bin/csi-livenessprobe >/dev/null 2>&1'

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All livenessprobe tests passed!"
''
