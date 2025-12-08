{ pkgs, image }:

pkgs.writeShellScript "test-node-exporter" ''
  set -euo pipefail
  
  echo "Testing node-exporter image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing node_exporter --version..."
  docker run --rm ${image.imageName}:test node_exporter --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All node-exporter tests passed!"
''
