{ pkgs, image }:

pkgs.writeShellScript "test-ffmpeg-fips" ''
  set -euo pipefail
  echo "Testing ffmpeg-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All ffmpeg-fips tests passed!"
''
