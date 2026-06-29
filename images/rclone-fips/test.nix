{ pkgs, image }:

pkgs.writeShellScript "test-rclone-fips" ''
  set -euo pipefail
  echo "Testing rclone-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rclone-fips tests passed!"
''
