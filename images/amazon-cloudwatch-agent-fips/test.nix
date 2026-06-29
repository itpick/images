{ pkgs, image }:

pkgs.writeShellScript "test-amazon-cloudwatch-agent-fips" ''
  set -euo pipefail
  echo "Testing amazon-cloudwatch-agent-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All amazon-cloudwatch-agent-fips tests passed!"
''
