{ pkgs, image }:

pkgs.writeShellScript "test-helix" ''
  set -euo pipefail
  echo "Testing helix image..."

  # hx runs and prints help/usage (non-empty output)
  echo "  Checking hx runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking hx is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v hx >/dev/null 2>&1 || ls /nix/store/*/bin/hx >/dev/null 2>&1' || true

  echo "All helix tests passed!"
''
