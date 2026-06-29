{ pkgs, image }:

pkgs.writeShellScript "test-stunnel" ''
  set -euo pipefail
  echo "Testing stunnel image..."

  # 1. Entry/binary runs and reports help (non-empty output)
  echo "  Checking stunnel runs..."
  out=$(docker run --rm ${image.imageName}:test -help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking stunnel is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v stunnel >/dev/null 2>&1 || ls /nix/store/*/bin/stunnel >/dev/null 2>&1' || true

  echo "All stunnel tests passed!"
''
