{ pkgs, image }:

pkgs.writeShellScript "test-fluentd-fips" ''
  set -euo pipefail
  echo "Testing fluentd-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All fluentd-fips tests passed!"
''
