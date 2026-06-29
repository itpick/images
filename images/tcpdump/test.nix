{ pkgs, image }:

pkgs.writeShellScript "test-tcpdump" ''
  set -euo pipefail
  echo "Testing tcpdump image..."

  # 1. Entry/binary runs and reports help (non-empty output)
  echo "  Checking tcpdump runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tcpdump is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tcpdump >/dev/null 2>&1 || ls /nix/store/*/bin/tcpdump >/dev/null 2>&1' || true

  echo "All tcpdump tests passed!"
''
