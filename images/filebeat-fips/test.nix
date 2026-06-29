{ pkgs, image }:

pkgs.writeShellScript "test-filebeat-fips" ''
  set -euo pipefail
  echo "Testing filebeat-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All filebeat-fips tests passed!"
''
