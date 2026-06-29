{ pkgs, image }:

pkgs.writeShellScript "test-ghidra" ''
  set -euo pipefail
  echo "Testing ghidra image..."

  # Image runs a shell and root filesystem is readable
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Expected binary present in image
  echo "  Checking ghidra is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ghidra >/dev/null 2>&1 || ls /nix/store/*/bin/ghidra >/dev/null 2>&1'

  echo "All ghidra tests passed!"
''
