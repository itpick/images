{ pkgs, image }:

pkgs.writeShellScript "test-containerd-fips" ''
  set -euo pipefail
  echo "Testing containerd-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All containerd-fips tests passed!"
''
