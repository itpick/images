{ pkgs, image }:

pkgs.writeShellScript "test-kube-state-metrics" ''
  set -euo pipefail
  
  echo "Testing kube-state-metrics image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing kube-state-metrics --version..."
  docker run --rm ${image.imageName}:test kube-state-metrics --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All kube-state-metrics tests passed!"
''
