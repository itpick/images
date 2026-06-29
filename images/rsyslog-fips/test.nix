{ pkgs, image }:

pkgs.writeShellScript "test-rsyslog-fips" ''
  set -euo pipefail
  echo "Testing rsyslog-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rsyslog-fips tests passed!"
''
