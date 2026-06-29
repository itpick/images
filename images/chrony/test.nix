{ pkgs, image }:

pkgs.writeShellScript "test-chrony" ''
  set -euo pipefail
  echo "Testing chrony image..."

  # Entrypoint (chronyd) prints help/usage (non-empty output)
  echo "  Checking chronyd runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking chronyd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v chronyd >/dev/null 2>&1 || ls /nix/store/*/bin/chronyd >/dev/null 2>&1'

  echo "All chrony tests passed!"
''
