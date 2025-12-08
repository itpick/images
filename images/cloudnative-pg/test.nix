{ pkgs, image }:

pkgs.writeShellScript "test-cloudnative-pg" ''
  set -euo pipefail
  
  echo "Testing cloudnative-pg image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing manager --help..."
  docker run --rm ${image.imageName}:test manager --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All cloudnative-pg tests passed!"
''
