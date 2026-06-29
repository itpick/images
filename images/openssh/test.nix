{ pkgs, image }:

pkgs.writeShellScript "test-openssh" ''
  set -euo pipefail
  echo "Testing openssh image..."

  # 1. ssh reports its version (-V prints to stderr, exits 0)
  echo "  Checking ssh -V..."
  out=$(docker run --rm ${image.imageName}:test -V 2>&1)
  [ -n "$out" ]

  # 2. ssh binary present in image
  echo "  Checking ssh binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v ssh >/dev/null 2>&1 || ls /nix/store/*/bin/ssh >/dev/null 2>&1'

  echo "All openssh tests passed!"
''
