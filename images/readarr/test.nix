{ pkgs, image }:

pkgs.writeShellScript "test-readarr" ''
  set -euo pipefail
  echo "Testing readarr image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking Readarr is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v Readarr >/dev/null 2>&1 || ls /nix/store/*/bin/Readarr >/dev/null 2>&1'

  echo "All readarr tests passed!"
''
