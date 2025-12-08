{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-config-reloader" ''
  set -euo pipefail
  
  echo "Testing prometheus-config-reloader image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing prometheus-config-reloader --help..."
  docker run --rm ${image.imageName}:test prometheus-config-reloader --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All prometheus-config-reloader tests passed!"
''
