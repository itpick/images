{ pkgs, image }:

pkgs.writeShellScript "test-nushell" ''
  set -euo pipefail
  echo "Testing nushell image..."

  # 1. Entrypoint (nu) runs version and prints non-empty output
  echo "  Checking nu runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nu binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls /nix/store/*/bin/nu >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All nushell tests passed!"
''
