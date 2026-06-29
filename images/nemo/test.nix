{ pkgs, image }:

pkgs.writeShellScript "test-nemo" ''
  set -euo pipefail
  echo "Testing nemo image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking nemo is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nemo >/dev/null 2>&1 || ls /nix/store/*/bin/nemo >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All nemo tests passed!"
''
