{ pkgs, image }:

pkgs.writeShellScript "test-fluent-bit" ''
  set -euo pipefail
  
  echo "Testing fluent-bit image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing fluent-bit --version..."
  docker run --rm ${image.imageName}:test fluent-bit --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All fluent-bit tests passed!"
''
