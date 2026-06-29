{ pkgs, image }:

pkgs.writeShellScript "test-sabnzbd" ''
  set -euo pipefail
  echo "Testing sabnzbd image..."

  # 1. Entrypoint runs and prints non-empty output (exit 0)
  echo "  Checking sabnzbd runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking sabnzbd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sabnzbd >/dev/null 2>&1 || ls /nix/store/*/bin/sabnzbd >/dev/null 2>&1'

  echo "All sabnzbd tests passed!"
''
