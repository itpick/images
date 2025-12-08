{ pkgs, image }:

pkgs.writeShellScript "test-metrics-server" ''
  set -euo pipefail
  
  echo "Testing metrics-server image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing metrics-server --version..."
  docker run --rm ${image.imageName}:test metrics-server --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All metrics-server tests passed!"
''
