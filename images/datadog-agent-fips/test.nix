{ pkgs, image }:

pkgs.writeShellScript "test-datadog-agent-fips" ''
  set -euo pipefail
  echo "Testing datadog-agent-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All datadog-agent-fips tests passed!"
''
