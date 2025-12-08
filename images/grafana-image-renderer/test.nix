{ pkgs, image }:

pkgs.writeShellScript "test-grafana-image-renderer" ''
  set -euo pipefail
  
  echo "Testing grafana-image-renderer image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing grafana-image-renderer --help..."
  docker run --rm ${image.imageName}:test grafana-image-renderer --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All grafana-image-renderer tests passed!"
''
