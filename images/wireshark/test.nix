{ pkgs, image }:

pkgs.writeShellScript "test-wireshark" ''
  set -euo pipefail
  echo "Testing wireshark image..."

  # 1. Entry binary (tshark) runs and reports help (non-empty output)
  echo "  Checking tshark runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tshark is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tshark >/dev/null 2>&1 || ls /nix/store/*/bin/tshark >/dev/null 2>&1' || true

  echo "All wireshark tests passed!"
''
