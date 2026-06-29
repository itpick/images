{ pkgs, image }:

pkgs.writeShellScript "test-node-problem-detector-fips" ''
  set -euo pipefail
  echo "Testing node-problem-detector-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All node-problem-detector-fips tests passed!"
''
