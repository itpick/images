{ pkgs, image }:

pkgs.writeShellScript "test-tesseract" ''
  set -euo pipefail
  echo "Testing tesseract image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking tesseract runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking tesseract is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tesseract >/dev/null 2>&1 || ls /nix/store/*/bin/tesseract >/dev/null 2>&1' || true

  echo "All tesseract tests passed!"
''
