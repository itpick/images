{ pkgs, image }:

pkgs.writeShellScript "test-gotenberg" ''
  set -euo pipefail
  echo "Testing gotenberg image..."

  # Server/long-running binary: avoid guessing a version flag. Smoke-test the
  # shell and assert the expected binary is present in the image.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking gotenberg binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gotenberg >/dev/null 2>&1 || ls /nix/store/*/bin/gotenberg >/dev/null 2>&1'

  echo "All gotenberg tests passed!"
''
