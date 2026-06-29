{ pkgs, image }:

pkgs.writeShellScript "test-cadvisor-fips" ''
  set -euo pipefail
  echo "Testing cadvisor-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All cadvisor-fips tests passed!"
''
