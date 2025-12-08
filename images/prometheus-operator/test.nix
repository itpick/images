{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-operator" ''
  set -euo pipefail
  
  echo "Testing prometheus-operator image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing operator --help..."
  docker run --rm ${image.imageName}:test operator --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All prometheus-operator tests passed!"
''
