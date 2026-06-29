{ pkgs, image }:

pkgs.writeShellScript "test-opencv" ''
  set -euo pipefail
  echo "Testing opencv image..."

  # 1. Entrypoint (opencv_version) runs and prints the OpenCV version (exit 0, non-empty)
  echo "  Checking opencv_version runs..."
  out=$(docker run --rm ${image.imageName}:test 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking opencv_version is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v opencv_version >/dev/null 2>&1 || ls /nix/store/*/bin/opencv_version >/dev/null 2>&1'

  echo "All opencv tests passed!"
''
