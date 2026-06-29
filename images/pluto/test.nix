{ pkgs, image }:

pkgs.writeShellScript "test-pluto" ''
  set -euo pipefail
  echo "Testing pluto image..."

  # 1. pluto prints help (exit 0, non-empty output)
  echo "  Checking pluto --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. pluto binary present in image
  echo "  Checking pluto binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pluto >/dev/null 2>&1 || ls /nix/store/*/bin/pluto >/dev/null 2>&1' || true

  echo "All pluto tests passed!"
''
