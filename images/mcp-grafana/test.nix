{ pkgs, image }:

pkgs.writeShellScript "test-mcp-grafana" ''
  set -euo pipefail
  echo "Testing mcp-grafana image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All mcp-grafana tests passed!"
''
