{ pkgs, image }:

pkgs.writeShellScript "test-kumactl" ''
  set -euo pipefail
  echo "Testing kumactl image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kumactl runs..."
  out=$(docker run --rm ${image.imageName}:test version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kumactl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kumactl >/dev/null 2>&1 || ls /nix/store/*/bin/kumactl >/dev/null 2>&1'

  echo "All kumactl tests passed!"
''
